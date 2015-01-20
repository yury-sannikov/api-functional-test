vows = require 'vows'
assert = require 'assert'
request = require 'request'
iisPort = 8088
_ = require 'lodash'
isGUID = (guid) ->
  /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test guid
loadFixture = (name) ->
  fx = require "../dist/#{name}.fixture.js"
  throw "Unable to load fixture #{name}" unless fx
  fx