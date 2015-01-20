vows.describe 'Retirement 401k Api'
    .addBatch
      'Add Beneficiary':
        topic: () ->
          request
            uri: "http://localhost:#{iisPort}/Retirement401k/AddBeneficiaries"
            method: 'POST'
            headers:
              'Content-Type': 'application/json'
              Host: "localhost:#{iisPort}"
            body: loadFixture 'add_beneficiary_1'
              .data
          , @callback
          undefined
        "should respond with 200": (err, res) ->
          assert.equal res.statusCode, 200
        "body should have expected format":
          topic: (res) ->
            JSON.parse(res.body)
          "Attachments shoul be null" :  (body) ->
            assert.equal body.Attachments, null
          "MessageResponseHeader should contain no errors":
            topic: (body) ->
              body.MessageResponseHeader
            "MessageResponses":
              topic: (hdr) ->
                hdr.MessageResponses
              "MessageResponses shoul be array and have 1 item": (messageResponses) ->
                assert _.isArray messageResponses
              "MessageResponses shoul have 201.1 code": (messageResponses) ->
                assert.equal messageResponses[0].ReturnCode, 201
                assert.equal messageResponses[0].ReasonCode, 1
              "ChildMessageResponse shoul be null": (messageResponses) ->
                assert.equal messageResponses.ChildMessageResponse, null
            "HasErrors shoul be false": (hdr) ->
              assert.equal hdr.HasErrors, false
            "MessageRequestHeader shoul contain required data":
              topic: (hdr) ->
                hdr.MessageRequestHeader
              "UserId shoul be eq to NRECA\txt1": (rq) ->
                assert.equal rq.UserId, "NRECA\txt1"
              "SecurityToken shoul be the same": (rq) ->
                assert.equal rq.SecurityToken, "security token 463548"
              "IDs shoul be set": (rq) ->
                assert rq.TransactionId and isGUID rq.TransactionId
                assert rq.AsyncCorrelationId and isGUID rq.AsyncCorrelationId
                assert rq.LogCorrelationId and isGUID rq.LogCorrelationId
                
.export module