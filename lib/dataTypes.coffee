require './utils/varHelpers.coffee'
BitwiseTests = require './utils/bitwiseTests.coffee'

class VLQ extends BitwiseTests


  create: (n) ->
    result = []

    return 0 if (n == 0)

    # we're going to loop through the bits from right to left
    while (n > 0)
      # grabs the value of the last 7 bits
      byte = n & 0x7f

      # removes the last 7 bits from n
      n >>= 7

      # adds continuation
      byte |= 0x80 if (n != 0)
      result.insert(0, byte)

    if (result.length > 1)
      result[0] |= 0x80
      result[result.length - 1] ^= 0x80

    return @arrayToHexadecimal(result)

  parse: (buffer) ->
    value = 0
    for byte, i in buffer
      value = (value << 7) | (byte & 0x7f)
      break if (byte & 0x80) == 0

    return value


class SignedVLQ extends BitwiseTests
  create: (value) ->
    try
      value = Math.abs(value * 2)
      if value < 0
        value -= 1
      return new VLQ().create(value)
    catch error
      throw("Error building SignedVLQ")

  parse: (buffer) ->
    value = new VLQ().parse(buffer)
    if (value & 1) == 0x00
      return value >> 1
    else
      return -((value >> 1) + 1)


class StarString extends BitwiseTests
  stringLength: (buffer) ->
    vlq = new VLQ()
    length = vlq.parse(buffer)
    return length

  create: (string) ->
    buffer = new Buffer(string)
    vlq = new VLQ()
    length = new Buffer(vlq.create(buffer.length), "hex")
    buffer = Buffer.concat([length, buffer]).toString("hex")
    return buffer

  parse: (buffer) ->
    stringLength = @stringLength(buffer)
    offset = 1
    buffer.toString("utf8", offset, stringLength + offset)


class Variant extends BitwiseTests
  create: -> return 0
  parse: -> return 0


class Uint8 extends BitwiseTests
  create: (n) ->
    buffer = new Buffer(1)
    buffer.writeUInt8(n, 0)
    buffer = buffer.toString("hex")
    return buffer
  parse: (buffer) ->
    value = buffer.readUInt8(0)
    return value

class Uint8Array extends BitwiseTests
  create: (n) -> return @arrayToHexadecimal(n)
  parse: (buffer) ->
    array = []
    for byte, i in buffer
      array[i] = buffer.readUInt8(i)
    return array

class Bool extends BitwiseTests
  create: (n) -> return new Uint8().create(n)
  parse: (buffer) -> return new Uint8().parse(buffer)

root = module.exports ? this

root.VLQ = VLQ
root.SignedVLQ = SignedVLQ
root.StarString = StarString
root.Variant = Variant
root.Uint8 = Uint8
root.Uint8Array = Uint8Array
root.Bool = Bool
