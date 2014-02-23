libDir = "../lib"

{ VLQ,
  SignedVLQ,
  StarString,
  Variant } = require("#{libDir}/dataTypes.coffee")

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
    parseHex: "0f636f6e6e6563742074696d656f7574"
    stringText: "connect timeout"

  it '::stringLength() should return the first byte as 15', ->
    starString = new StarString()
    buffer = new Buffer(testOpts.parseHex, "hex")
    value = starString.stringLength(buffer)
    value.should.equal 15

  it '::parse() should return the string "connect timeout"', ->
    starString = new StarString()
    buffer = new Buffer(testOpts.parseHex, "hex")
    value = starString.parse(buffer)
    value.should.equal testOpts.stringText

  it '::create() should return the parseHex', ->
    starString = new StarString()
    value = starString.create(testOpts.stringText)
    value = value.toString("hex")
    value.should.equal testOpts.parseHex


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
