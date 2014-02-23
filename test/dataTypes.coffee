libDir = "../lib"

{
  VLQ,
  SignedVLQ,
  StarString,
  Variant
} = require("#{libDir}/dataTypes.coffee")

describe 'VLQ', ->
  testOpts =
    initialNumber: 601000
    encodedBinary: "101001001101011100101000"
    encodedHex: "a4d728"

  it 'should create a VLQ that returns correct Hexadecimal', ->
    vlq = new VLQ()
    value = vlq.create(testOpts.initialNumber)
    value.should.equal testOpts.encodedHex

  it 'should parse a VLQ that returns correct Decimal', ->
    vlq = new VLQ()
    buffer = new Buffer(testOpts.encodedHex, "hex")
    value = vlq.parse(buffer)
    value.should.equal testOpts.initialNumber


describe 'SignedVLQ', ->
  testOpts =

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

  it 'should return StarString::parse', ->
    starString = new StarString()
    value = starString.parse()
    value.should.equal "StarString::parse"

  it 'should return StarString::create', ->
    starString = new StarString()
    value = starString.create()
    value.should.equal "StarString::create"


describe 'Variant', ->
  testOpts =

  it 'should return Variant::parse', ->
    variant = new Variant()
    value = variant.parse()
    value.should.equal "Variant::parse"

  it 'should return Variant::create', ->
    variant = new Variant()
    value = variant.create()
    value.should.equal "Variant::create"
