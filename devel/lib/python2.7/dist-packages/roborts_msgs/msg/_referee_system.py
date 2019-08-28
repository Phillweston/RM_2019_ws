# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from roborts_msgs/referee_system.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class referee_system(genpy.Message):
  _md5sum = "358d70f927f6ebe96797d1e067a0a634"
  _type = "roborts_msgs/referee_system"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8   armor_hurt_id
int16   remain_HP
int16   max_HP
float32 bullet_speed
float32 shooter_remain_heat
float32 shooter_max_heat"""
  __slots__ = ['armor_hurt_id','remain_HP','max_HP','bullet_speed','shooter_remain_heat','shooter_max_heat']
  _slot_types = ['uint8','int16','int16','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       armor_hurt_id,remain_HP,max_HP,bullet_speed,shooter_remain_heat,shooter_max_heat

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(referee_system, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.armor_hurt_id is None:
        self.armor_hurt_id = 0
      if self.remain_HP is None:
        self.remain_HP = 0
      if self.max_HP is None:
        self.max_HP = 0
      if self.bullet_speed is None:
        self.bullet_speed = 0.
      if self.shooter_remain_heat is None:
        self.shooter_remain_heat = 0.
      if self.shooter_max_heat is None:
        self.shooter_max_heat = 0.
    else:
      self.armor_hurt_id = 0
      self.remain_HP = 0
      self.max_HP = 0
      self.bullet_speed = 0.
      self.shooter_remain_heat = 0.
      self.shooter_max_heat = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_B2h3f().pack(_x.armor_hurt_id, _x.remain_HP, _x.max_HP, _x.bullet_speed, _x.shooter_remain_heat, _x.shooter_max_heat))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.armor_hurt_id, _x.remain_HP, _x.max_HP, _x.bullet_speed, _x.shooter_remain_heat, _x.shooter_max_heat,) = _get_struct_B2h3f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_B2h3f().pack(_x.armor_hurt_id, _x.remain_HP, _x.max_HP, _x.bullet_speed, _x.shooter_remain_heat, _x.shooter_max_heat))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.armor_hurt_id, _x.remain_HP, _x.max_HP, _x.bullet_speed, _x.shooter_remain_heat, _x.shooter_max_heat,) = _get_struct_B2h3f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B2h3f = None
def _get_struct_B2h3f():
    global _struct_B2h3f
    if _struct_B2h3f is None:
        _struct_B2h3f = struct.Struct("<B2h3f")
    return _struct_B2h3f