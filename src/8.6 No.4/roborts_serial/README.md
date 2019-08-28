# roborts_serial
先运行`robort_bringup`下的`create_udev_rules.sh`即可生成USB接口映射规则, 大疆STM32主控板对应`"/dev/serial_sdk"`, 串口模块对应`"dev/robomaster"`。

## 一、设计准则

视觉数据会经过非常多层的处理，才能反馈到具体效果上；视觉电控双方同时调试，很难定位问题所在；因此所有的视觉数据处理、智能决策、响应以及反馈全部由miniPC执行，电控只充当下位机，严格执行视觉的指令，不加任何额外处理。

如此一来，电控只需要专注于PID和底层控制，而其他的一切全部由视觉包揽，向ICRA全自动机器人看齐。

## 二、具体协议

### 机器人串口通信接收
```c++
uint8_t sof;                  // 帧头 = 0A
uint8_t cmd_mode;             // commod: 命令模式，0: 空闲 1: 自瞄 2: 打符 ...
uint8_t gimbal_mode;          // gimbal: 云台模式，0: 发送角度 1: 发送速度
int16_t gimbal_yaw;           // gimbal: 单位：角度 x 1000
int16_t gimbal_pitch;         // gimbal: 单位：角度 x 1000
uint8_t chassis_mode;         // chassis: 底盘模式，0: 云台坐标以底盘建系 1: 云台坐标以地面建系
int16_t chassis_x;            // chassis: 底盘前行的速度，单位：todo
int16_t chassis_y;            // chassis: 底盘平移的速度，单位：todo
int16_t chassis_r;            // chassis: 底盘旋转的速度，单位：todo
uint8_t armor_hurt_id;        // referee_system: 机器人受伤害id，按照装甲片id顺序定义 1 2 3 4 5
int16_t remain_HP;            // referee_system: 机器人剩余血量，裁判系统数值，整数
int16_t max_HP;               // referee_system: 机器人最大血量，裁判系统数值，整数
int16_t bullet_speed;         // referee_system: 机器人枪口射速，裁判系统数值 x 10
int16_t shooter_remain_heat;  // referee_system: 机器人剩余热量，裁判系统数值 x 10
int16_t shooter_max_heat;     // referee_system: 机器人最大热量，裁判系统数值 x 10
uint8_t end;                  // 帧尾 = B0
```
**Note:**

串口通信接收分为`commod`、`gimbal`、`chassis`、`referee_system`四个部分，其中：

1. `commod` 命令模式用于手自一体, 对应操作手键位用于视觉任务的切换。
2. `gimbal` 是视觉所需要的重要信息，云台建立坐标系, 归中为零零, yaw角度向右为正, pitch角度向上为正; 速度同理。
3. `chassis` 是视觉空间坐标计算的模型拓展，用于提高运动打击的命中率。
4. `referee_system` 是裁判系统的反馈数值，是视觉进一步接管机器人控制权的重要保证，尤其是对于哨兵而言。

### 机器人串口通信发送
```c++
uint8_t sof;                    // 帧头 = 0C
uint8_t task_id;                // feedback: 见任务表，任务id
uint8_t vision_data_status;     // feedback: 见任务表，数据状态
int16_t vision_data_x;          // feedback: 整数，单位: cm
int16_t vision_data_y;          // feedback: 整数，单位: cm
int16_t vision_data_z;          // feedback: 整数，单位: cm
uint8_t cmd_gimbal_mode;        // gimbal: 控制模式，1: 绝对角度 2: 相对角度 3: 绝对速度 4: 相对速度
int16_t cmd_gimbal_yaw;         // gimbal: 云台控制，单位同接收
int16_t cmd_gimbal_pitch;       // gimbal: 云台控制，单位同接收
uint8_t cmd_gimbal_fric_speed;  // gimbal: 设置摩擦轮的转速档位，1: 12m/s 2: 18m/s 3: 24m/s 4: 30m/s
uint8_t cmd_chassis_mode;       // chassis: 控制模式，0: 无效 1: 移动 2：陀螺CW 3：陀螺CCW
int16_t cmd_chassis_x;          // chassis: 底盘前行的速度，单位：todo
int16_t cmd_chassis_y;          // chassis: 底盘平移的速度，单位：todo
int16_t cmd_chassis_r;          // chassis: 底盘旋转的速度，单位：todo
uint8_t end;                    // 帧尾 = D0
```
**Note:**

串口通信发送分为`feedback`、`gimbal`、`chassis` 三个部分，其中：

1. `feedback` 是视觉反馈，属于冗余数据，电控可以选择不接收，但这些数据对于临场改代码和快速debug很有帮助。
2. `gimbal` 是视觉对云台的控制，控制频率100Hz，结合视觉反馈可以做出牛逼的效果。需要额外说明的是，`cmd_gimbal_fric_speed`是视觉发送给电控的射速档位，电控不必要忠实执行，误差是允许的。视觉弹道计算只会采用`referee_system`的反馈数值，当`referee_system`离线或者数据异常时，视觉才会按这一数值计算弹道。
3. `chassis` 是视觉对底盘的控制，控制频率100Hz，虽然这一数据应该只用于哨兵，但是战场上仍有很多操作手难以察觉的情况，比如无人机扫射，或者背后受敌，需要开猫步等等。而在自瞄的时候，视觉控制底盘可以调整自己的最佳射击视野，或者追击敌人，但这样的操作仍需要操作手监控。如果这一数据用于手自一体机器人，建议做人机工程，来告知操作手需不需要视觉来接手底盘，给操作手选择。

关于视觉反馈视觉的详细说明：

1. `task_id`是执行何种任务。
2. `vision_data_status`是标志位，需要与`task_id`组合使用， `xyz` 是坐标，电控可以用来作额外数据检查。
3. 极简模式下，仅仅依据 `cmd_gimbal_yaw`和`cmd_gimbal_pitch`就可以实现控制。 
4. xyz的坐标定义, x向右为正, y向上为正, z向前为正。

#### task_id任务表

| task_id | cmd_mode = 0 | cmd_mode = 1 or 2 | 
|:--------|:-------------|:------------------|
|    0    |      无效    |        待命        |
|    1    |      无效    |      瞄准跟随      |
|    2    |      无效    |        点射        |
|    3    |      无效    |      连续射击      | 

#### vision_data_status任务表
cmd_mode = 0，task_id无效，vision_data_status无效。

cmd_mode = 1

| status | task_id = 1 | task_id = 2 |task_id = 3   |
|:-------|:------------|:------------|:---------------|
|    0   |    无效     |     无效     |    无效        |
|    1   |  跟随程度   |   点射1发    |     无效       |
|    2   |  跟随程度   |   点射2发    |     无效       |
|    3   |  跟随程度   |   点秒3发    |     无效       |
|    4   |  跟随程度   |   点射4发    |     无效       |
|    5   |  跟随程度   |   点射5发    |     无效       |

cmd_mode = 2

|     | vision_data_status |
|:----|:-------------------|
|  0  |   当前打符进度0/5   |
|  1  |   当前打符进度1/5   |
|  2  |   当前打符进度2/5   |
|  3  |   当前打符进度3/5   |
|  4  |   当前打符进度4/5   |
|  5  |   当前打符进度5/5   |

**Note:**
1. cmd_mode = 1 , task_id = 4, vision_data_status输出状态可以被打断。
2. 视觉要把电控视作不会思考的下位机，所有的调参集中于视觉，对方是步兵还是英雄，是猫步还是陀螺，决策逻辑都是视觉内部完成，到达串口传输时，就只是单纯的命令。
3. 点射用于精准打击，连射用于火力压制，这些调参都由视觉完成，如果两边同时调参，效果很玄学。
4. 手自一体的机器人也适用于这一协议，操作手点一下鼠标，会触发电控接收数据，而发射模式是由视觉决定的，比如触发自瞄后，按鼠标左键可能会3连发，哒哒哒~。

## 三、技术原理

单ROS节点，双线程以固定频率强制发送与接受；该ROS节点不定时接收其他节点的数据，然后只负责更新数据。

`/sdk`下面是串口底层实现，为了代码解耦、模块化、不要往里面加协议相关的东西，更不要加其他奇奇怪怪的东西。

`/serial`是串口协议的实现部分，这里大部分都是人为规定，单位、方向、角度、乘1000、除以1000、等等。今后会更加严格的统一。

云台控制中的速度值得一试，根据电控PID，我们直接发PID的输入量或许会好很多。

所有机器人都使用同一份串口协议。目前，数据发送与数据更新的部分可能需要加锁。