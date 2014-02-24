expect = require("chai").expect

libDir = "../lib"

{ VLQ,
  SignedVLQ,
  StarString,
  Variant,
  Uint8,
  Uint8Array,
  Bool } = require("#{libDir}/dataTypes.coffee")

describe "VLQ", ->
  testOpts =
    initialNumber: 601000
    encodedBinary: "101001001101011100101000"
    encodedHex: "a4d728"

  it "::create(#{testOpts.initialNumber}) should return #{testOpts.encodedHex}", ->
    vlq = new VLQ()
    value = vlq.create(testOpts.initialNumber)
    value.should.equal testOpts.encodedHex

  it "::parse(#{testOpts.encodedHex}) should return #{testOpts.initialNumber}", ->
    vlq = new VLQ()
    buffer = testOpts.encodedHex
    value = vlq.parse(buffer)
    value.should.equal testOpts.initialNumber


describe "SignedVLQ", ->
  testOpts =
    initialNumber: 601000
    encodedHex: "c9ae50"

  it "::create(#{testOpts.initialNumber}) should return #{testOpts.encodedHex}", ->
    svlq = new SignedVLQ()
    value = svlq.create(testOpts.initialNumber)
    value.should.equal testOpts.encodedHex

  it "::parse(#{testOpts.encodedHex}) should return #{testOpts.initialNumber}", ->
    svlq = new SignedVLQ()
    buffer = testOpts.encodedHex
    value = svlq.parse(buffer)
    value.should.equal testOpts.initialNumber


describe "StarString", ->
  testOpts =
    parseHex: "067a6f6d626965"
    stringText: "zombie"


  it "::create(#{testOpts.stringText}) should return '#{testOpts.parseHex}'", ->
    starString = new StarString()
    value = starString.create(testOpts.stringText)
    value = value.toString("hex")
    value.should.equal testOpts.parseHex

  it "::parse(#{testOpts.parseHex}) should return the string '#{testOpts.stringText}'", ->
    starString = new StarString()
    buffer = testOpts.parseHex
    value = starString.parse(buffer)
    value.should.equal testOpts.stringText



describe "Variant", ->
  testOpts =

  it "::create() should return 0", ->
    variant = new Variant()
    value = variant.create()
    value.should.equal 0

  it "::parse() should return 0", ->
    variant = new Variant()
    value = variant.parse()
    value.should.equal 0



describe "Uint8", ->
  testOpts =
    decimal: 3
    hex: "03"

  it "::create(#{testOpts.decimal}) should return #{testOpts.hex}", ->
    uint8 = new Uint8()
    value = uint8.create(testOpts.decimal)
    value.should.equal testOpts.hex

  it "::parse(#{testOpts.hex}) should return #{testOpts.decimal}", ->
    uint8 = new Uint8()
    value = uint8.parse(testOpts.hex)
    value.should.equal testOpts.decimal


describe "Uint8Array", ->
  testOpts =
    decimal: [63, 7, 114]
    hex: "3f0772"

  it "::create([#{testOpts.decimal}]) should return #{testOpts.hex}", ->
    uint8Array = new Uint8Array()
    value = uint8Array.create(testOpts.decimal)
    value.should.equal testOpts.hex

  it "::parse(#{testOpts.hex}) should return [#{testOpts.decimal}]", ->
    uint8Array = new Uint8Array()
    value = uint8Array.parse(testOpts.hex)
    expect(value).is.an('array')
      .that.deep.equals testOpts.decimal


describe "Bool", ->
  testOpts =
    boolean: 0
    hex: "00"

  it "::create(#{testOpts.boolean}) should return #{testOpts.hex}", ->
    variant = new Bool()
    value = variant.create(testOpts.boolean)
    value.should.equal testOpts.hex

  it "::parse(#{testOpts.hex}) should return #{testOpts.boolean}", ->
    variant = new Bool()
    value = variant.parse(testOpts.hex)
    value.should.equal testOpts.boolean

