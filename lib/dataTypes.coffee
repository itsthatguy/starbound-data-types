require './utils/varHelpers.coffee'
BitwiseTests = require './utils/bitwiseTests.coffee'

class DataTypes extends BitwiseTests

  constructor: -> "DataTypes"

  parseVLQ: (buffer) ->


  createVLQ: (n) ->
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

module.exports = DataTypes
