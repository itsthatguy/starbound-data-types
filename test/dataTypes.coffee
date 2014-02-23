libDir = "../lib"

{VLQ, SignedVLQ, StarString} = require("#{libDir}/dataTypes.coffee")

describe 'VLQ', ->
  testOpts =
    initialNumber: 601000

  it 'should encrypt the expected VLQ value', ->
    vlq = new VLQ()
    value = vlq.create(testOpts.initialNumber)
    value.should.equal "a4d728"

  it 'should return VLQ::parse', ->
    vlq = new VLQ()
    value = vlq.parse()
    value.should.equal "VLQ::parse"


describe 'SignedVLQ', ->
  testOpts =
    initialNumber: 601000

  it 'should return SignedVLQ::parse', ->
    svlq = new SignedVLQ()
    value = svlq.parse()
    value.should.equal "SignedVLQ::parse"

  it 'should return SignedVLQ::create', ->
    svlq = new SignedVLQ()
    value = svlq.create()
    value.should.equal "SignedVLQ::create"


describe 'StarString', ->
  testOpts =
    initialNumber: 601000

  it 'should return StarString::parse', ->
    starString = new StarString()
    value = starString.parse()
    value.should.equal "StarString::parse"

  it 'should return StarString::create', ->
    starString = new StarString()
    value = starString.create()
    value.should.equal "StarString::create"

describe 'StarString', ->
  testOpts =
    initialNumber: 601000

  it 'should encrypt the expected VLQ value', ->
    vlq = new VLQ()
    value = vlq.create(testOpts.initialNumber)
    value.should.equal "a4d728"
