module.exports = 
  data : """
  {
    "Attachments":[{},{}],
    "Header":{
      "MessageRequestHeader":{
        "UserId":"NRECA\txt1",
        "SecurityToken":"security token 463548",
        "ClientSystemId":"CommonObjectsFramework",
        "Subgroupid":"Benefits",
        "TransactionId":"0e29f06e-9123-46f1-a52b-399ac25c31f6",
        "AsyncCorrelationId":"60f4971e-0711-4c2d-a1be-4fb6e86b763c",
        "LogCorrelationId":"de9629c2-78c9-4286-87a4-ab5579d7a73e",
        "UserRoles":[ {
            "Name":"Benefits Administrator",
            "Subgroupids":["accounting","merchindising","advertising"]
          },
          {
            "Name":"Membership Administrator",
            "Subgroupids":["membership","benefits"]
          }],
        "SystemId":null,
        "SystemRoles":["role1","role2"]
      }
    },
    "Body":{
      "ParticipantCid":"001386684",
      "NewBeneficiaries":
      [
        {
          "IndividualBeneficiaryIndicator":false,
          "IndividualBeneficiary":null,
          "InstitutionBeneficiary":{
            "Cid":"100000021",
            "BeneficiaryTypeCode":"RT",
            "Name":"Willow Pond Trust",
            "Fein":"84733",
            "Address":{
              "Line1":"17b Mulberry Ln",
              "Line2":"Ste 300",
              "City":"Falls Church",
              "State":"VA",
              "ZipCode":"20133",
              "County":"Fairfax",
              "Country":"USA",
              "Type":"Home",
              "PurposeCodes":["for 401k allocations", "for RS benefits"],
              "EffectiveFromDate":"1980-01-02",
              "EffectiveThruDate":"1990-08-09"
            },
            "Email":{
              "Address":"jane.doe@home.com",
              "Type":"Home",
              "PurposeCodes":["for 401k allocations", "for RS benefits"],
              "EffectiveFromDate":"1980-01-02",
              "EffectiveThruDate":"1990-08-09"
            },
            "Phones":[
              {
                "Number":"703-111-1111",
                "Extension":"123",
                "CountryCallingCode":"1",
                "Type":"Home",
                "PurposeCodes":["for 401k allocations", "for RS benefits"],
                "EffectiveFromDate":"1980-01-02",
                "EffectiveThruDate":"1990-08-09"              
              },
              {
                "Number":"703-141-1311",
                "Extension":"",
                "CountryCallingCode":"1",
                "Type":"Mobile",
                "PurposeCodes":["for 401k allocations", "for RS benefits"],
                "EffectiveFromDate":"1980-01-02",
                "EffectiveThruDate":"1990-08-09"              
              }
            ]
          }
        },
        {
          "IndividualBeneficiaryIndicator":false,
          "IndividualBeneficiary":null,
          "InstitutionBeneficiary":{
            "Cid":"100000022",
            "BeneficiaryTypeCode":"RT",
            "Name":"Elm Tree Trust",
            "Fein":"76620",
            "Address":{
              "Line1":"14500 Sky Drive",
              "Line2":"Ste 1700",
              "City":"McLean",
              "State":"VA",
              "ZipCode":"22103",
              "County":"McLean",
              "Country":"USA",
              "Type":"Office",
              "PurposeCodes":["for 401k allocations", "for RS benefits"],
              "EffectiveFromDate":"1984-06-12",
              "EffectiveThruDate":"1989-07-12"
            },
            "Email":{
              "Address":"jane.doe@home.com",
              "Type":"Office",
              "PurposeCodes":["for 401k allocations", "for RS benefits"],
              "EffectiveFromDate":"2001-11-10",
              "EffectiveThruDate":"2004-12-01"
            },
            "Phones":[
              {
                "Number":"703-111-1111",
                "Extension":"123",
                "CountryCallingCode":"1",
                "Type":"Home",
                "PurposeCodes":["for 401k allocations", "for RS benefits"],
                "EffectiveFromDate":"1980-01-02",
                "EffectiveThruDate":"1990-08-09"              
              },
              {
                "Number":"703-141-1311",
                "Extension":"",
                "CountryCallingCode":"1",
                "Type":"Mobile",
                "PurposeCodes":["for 401k allocations", "for RS benefits"],
                "EffectiveFromDate":"1980-01-02",
                "EffectiveThruDate":"1990-08-09"              
              }
            ]
          }
        }     
      ],
      "BeneficiaryAllocations":[
        {
          "Cid":"100000021",
          "BeneficiaryDesignationTypeCode":"Primary",
          "AllocationPercent":"70"
        },
        {
          "Cid":"100000022",
          "BeneficiaryDesignationTypeCode":"Primary",
          "AllocationPercent":"30"
        }
      ]
    }
  }
  """