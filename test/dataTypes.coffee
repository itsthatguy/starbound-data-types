libDir = "../lib"

{VLQ, SignedVLQ, StarString} = require("#{libDir}/dataTypes.coffee")

describe 'DataTypes', ->
  testOpts =
    initialNumber: 601000

  it 'VLQ should encrypt the expected VLQ value', ->
    vlq = new VLQ()
    value = vlq.createVLQ(testOpts.initialNumber)
    value.should.equal "a4d728"
