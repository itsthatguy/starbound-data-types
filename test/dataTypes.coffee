libDir = "../lib"

DataTypes = require("#{libDir}/dataTypes.coffee")

describe 'DataTypes', ->
  testOpts =
    initialNumber: 601000

  it 'should encrypt the expected VLQ value', ->
    dataTypes = new DataTypes()
    vlq = dataTypes.createVLQ(testOpts.initialNumber)
    vlq.should.equal "a4d728"
