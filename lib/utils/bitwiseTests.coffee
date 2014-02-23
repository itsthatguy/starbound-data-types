class BitwiseTests

  arrayToBinary: (array) -> (array.map (n) => @intToBinary(n)).join('')
  arrayToHexadecimal: (array) -> (array.map (n) => @intToHexadecimal(n)).join('')
  intToHexadecimal: (number) ->
    byte = parseInt(number).toString(16)
    while (byte.length < 2)
      byte = "0" + byte
    return byte
  intToBinary: (number) -> return parseInt(number).toString(2)

module.exports = BitwiseTests


