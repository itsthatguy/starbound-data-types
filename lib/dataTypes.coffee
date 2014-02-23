require './utils/varHelpers.coffee'
BitwiseTests = require './utils/bitwiseTests.coffee'

class VLQ extends BitwiseTests
  parse: -> "VLQ::parse"
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

class SignedVLQ extends BitwiseTests
  parse: -> "SignedVLQ::parse"
  create: -> "SignedVLQ::create"


class StarString extends BitwiseTests
  parse: -> "StarString::parse"
  create: -> "StarString::create"


class Variant extends BitwiseTests
  parse: -> "Variant::parse"
  create: -> "Variant::create"

root = module.exports ? this

root.VLQ = VLQ
root.SignedVLQ = SignedVLQ
root.StarString = StarString
root.Variant = Variant
