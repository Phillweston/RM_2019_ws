# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from roborts_msgs/gimbal_info.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class gimbal_info(genpy.Message):
  _md5sum = "ff1dad119a0d9688115465f7f16fbe0b"
  _type = "roborts_msgs/gimbal_info"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8   gimbal_mode
float32 gimbal_yaw
float32 gimbal_pitch"""
  __slots__ = ['gimbal_mode','gimbal_yaw','gimbal_pitch']
  _slot_types = ['uint8','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       gimbal_mode,gimbal_yaw,gimbal_pitch

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(gimbal_info, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.gimbal_mode is None:
        self.gimbal_mode = 0
      if self.gimbal_yaw is None:
        self.gimbal_yaw = 0.
      if self.gimbal_pitch is None:
        self.gimbal_pitch = 0.
    else:
      self.gimbal_mode = 0
      self.gimbal_yaw = 0.
      self.gimbal_pitch = 0.

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
      buff.write(_get_struct_B2f().pack(_x.gimbal_mode, _x.gimbal_yaw, _x.gimbal_pitch))
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
      end += 9
      (_x.gimbal_mode, _x.gimbal_yaw, _x.gimbal_pitch,) = _get_struct_B2f().unpack(str[start:end])
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
      buff.write(_get_struct_B2f().pack(_x.gimbal_mode, _x.gimbal_yaw, _x.gimbal_pitch))
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
      end += 9
      (_x.gimbal_mode, _x.gimbal_yaw, _x.gimbal_pitch,) = _get_struct_B2f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B2f = None
def _get_struct_B2f():
    global _struct_B2f
    if _struct_B2f is None:
        _struct_B2f = struct.Struct("<B2f")
    return _struct_B2f
