Feature: Smoke tests for Validation Schema APIs


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general B2B create bank account transfer payload with only required fields in Indonesia instance
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "IDR",
                                    "units": "10.0"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "mobile_number": "+85212345678",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "IDN",
                               "segment": "business",
                               "company_name": "test destination company",
                               "company_registration_number": "11223344",
                               "company_registration_country": "PHL",
                               "bank": "002",
                               "account_number": "12345678"
                },
                "compliance":{
                              "source_of_funds": "06",
                              "remittance_purpose": "007-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general B2B create bank account transfer payload with only required fields in China instance
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload":{
                "source_amount":{
                                    "currency": "USD",
                                    "units": "10.0"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "CHN",
                               "segment": "business",
                               "currency": "CNH",
                               "company_name": "test destination company",
                               "account_number": "12345678",
                               "address_line": "test recipient address",
                               "swift_code": "CHBKPHMMXXX"
                },
                "compliance":{
                              "source_of_funds": "06",
                              "remittance_purpose": "007-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general B2B create bank account transfer payload with only required fields in Japan instance
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload":{
                "source_amount":{
                                    "currency": "USD",
                                    "units": "10.0"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "JPN",
                               "segment": "business",
                               "company_name": "test destination company",
                               "bank": "0001",
                               "branch": "599",
                               "account_number": "1234567",
                               "address_line": "test recipient address",
                               "address_city": "test recipient city",
                               "address_zip": "225-0011"
                },
                "compliance":{
                              "source_of_funds": "06",
                              "remittance_purpose": "007-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general B2B create bank account transfer payload with only required fields in Korea instance
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "KRW",
                                    "units": "1"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "KOR",
                               "segment": "business",
                               "mobile_number": "+85212345678",
                               "company_name": "test sending company",
                               "company_registration_number": "1234",
                               "bank": "BNPPARIBAS_061",
                               "account_number": "1234567",
                               "address_line": "test recipient address",
                               "address_city": "test recipient city",
                               "address_country": "KOR"
                },
                "compliance":{
                              "source_of_funds": "06",
                              "remittance_purpose": "007-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general B2B create bank account transfer payload with only required fields in SEPA instance
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "EUR",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "DEU",
                               "segment": "business",
                               "company_name": "test sending company",
                               "swift_code": "DEUTDEMM",
                               "iban": "DE89 3704 0044 0532 0130 00"
                },
                "compliance":{
                              "source_of_funds": "06",
                              "remittance_purpose": "007-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general B2B create bank account transfer payload with only required fields in UK instance
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "GBP",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "GBR",
                               "segment": "business",
                               "currency": "GBP",
                               "company_name": "test sending company",
                               "sort_code": "12-34-56",
                               "account_number":"12345678"
                },
                "compliance":{
                              "source_of_funds": "06"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general B2B create bank account transfer payload with only required fields in Thailand instance
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """x`
    {
      "partner": "B2B_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "THB",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "THA",
                               "segment": "business",
                               "company_name": "test sending company",
                               "bank": "002",
                               "account_number": "12345678",
                               "address_line": "test recipient address",
                               "address_city": "test recipient city",
                               "address_country": "THA"
                },
                "compliance":{
                              "code": "05"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of B2B create bank account transfer payload with McTransfast partner in only required fields in Japan instance
    Given call Login API with partner username as "mctransfast" and password as "mctransfast_password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "mctransfast",
      "payload":{
                "source_amount":{
                                    "currency": "USD",
                                    "units": "10.0"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "company_registration_country": "PHL",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "JPN",
                               "segment": "business",
                               "company_name": "test destination company",
                               "bank": "0001",
                               "branch": "599",
                               "account_number": "1234567",
                               "address_line": "test recipient address",
                               "address_city": "test recipient city",
                               "address_zip": "225-0011"
                },
                "compliance":{
                              "source_of_funds": "06",
                              "remittance_purpose": "007-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of B2B create bank account transfer payload with McTransfast partner in only required fields in China instance
    Given call Login API with partner username as "mctransfast" and password as "mctransfast_password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "mctransfast",
      "payload":{
                "source_amount":{
                                    "currency": "USD",
                                    "units": "10.0"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "business",
                          "sender_id": "123456",
                          "company_name": "test source company",
                          "company_trading_name": "test source company trading name",
                          "address_line": "test address line",
                          "address_city": "test address city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "CHN",
                               "segment": "business",
                               "currency": "CNH",
                               "company_name": "test destination company",
                               "account_number": "12345678",
                               "address_line": "test recipient address",
                               "swift_code": "CHBKPHMMXXX"
                },
                "compliance":{
                              "source_of_funds": "06",
                              "remittance_purpose": "007-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general C2C create E-Wallet transfer payload with only required fields in Indonesia instance
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "IDR",
                                    "units": "1"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "id_number": "12345678",
                          "id_type": "national",
                          "id_country": "PHL",
                          "legal_name_first": "test sender first name",
                          "mobile_number": "+85212345678",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "ewallet",
                               "country": "IDN",
                               "segment": "individual",
                               "partner": "emq_partner_gopay",
                               "legal_name_first": "test recipient first name",
                               "address_city_code": "10740",
                               "ewallet_id": "1234567"
                },
                "compliance":{
                              "relationship":{
                                              "code": "05"
                              }
                              "source_of_funds": "03",
                              "remittance_purpose": "008-02",
                              "occupation": "013"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general C2C create bank account transfer payload with only required fields in Nepal instance
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "NPR",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "gender": "M",
                          "mobile_number": "+85212345678",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "NPL",
                               "segment": "individual",
                               "mobile_number": "+85212345678",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "bank": "70807300",
                               "account_number": "12345678"
                },
                "compliance":{
                              "source_of_funds": "02",
                              "remittance_purpose": "001-01",
                              "occupation": "013"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general C2C create bank account transfer payload with only required fields in SEPA instance
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "PHP",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "DEU",
                               "segment": "individual",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "swift_code": "DEUTDEMM",
                               "iban": "DE89 3704 0044 0532 0130 00"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general C2C create bank account transfer payload with only required fields in Korea instance
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "KRW",
                                    "units": "1"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "KOR",
                               "segment": "individual",
                               "date_of_birth": "2007-05-01",
                               "mobile_number": "+85212345678",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "bank": "BNPPARIBAS_061",
                               "account_number": "1234567"
                },
                "compliance":{
                              "remittance_purpose": "001-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general C2C create bank account transfer payload with only required fields in Japan instance
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "source_amount":{
                                    "currency": "USD",
                                    "units": "1"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "JPN",
                               "segment": "individual",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "bank": "0001",
                               "branch": "599",
                               "account_number": "12345678"
                },
                "compliance":{
                              "source_of_funds": "04",
                              "remittance_purpose": "001-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general C2C create bank account transfer payload with only required fields in Thailand instance
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "THB",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "THA",
                               "segment": "individual",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "bank": "002",
                               "account_number": "12345678",
                               "address_line": "test recipient address",
                               "address_city": "test recipient city",
                               "address_country": "THA"
                },
                "compliance":{
                              "remittance_purpose": "002-02"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of general C2C create Home Delivery transfer payload with only required fields in VietNam instance
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "destination_amount":{
                                    "currency": "VND",
                                    "units": "200"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "cash_delivery",
                               "country": "VNM",
                               "segment": "individual",
                               "partner": "emq_partner_sbr",
                               "mobile_number": "+84212345678",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "address_line": "test recipient address",
                               "address_city": "test recipient city",
                               "id_type": "passport"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of C2C create bank account transfer payload with McTransfast partner in only required fields in Japan instance
    Given call Login API with partner username as "mctransfast" and password as "mctransfast_password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "mctransfast",
      "payload":{
                "source_amount":{
                                    "currency": "USD",
                                    "units": "1"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "JPN",
                               "segment": "individual",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "bank": "0001",
                               "branch": "599",
                               "account_number": "12345678"
                },
                "compliance":{
                              "source_of_funds": "04",
                              "remittance_purpose": "001-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of C2C create bank account transfer payload with McTransfast partner in only required fields in China instance
    Given call Login API with partner username as "mctransfast" and password as "mctransfast_password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "mctransfast",
      "payload":{
                "destination_amount":{
                                    "currency": "CNY",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "CHN",
                               "segment": "individual",
                               "mobile_number": "+8613087654321",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "account_number": "6217900112345678"
                },
                "compliance":{
                              "remittance_purpose": "003-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of C2C create bank account transfer payload with Inpay-as partner in only required fields in Japan instance
    Given call Login API with partner username as "inpayas" and password as "inpayas-password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload":{
                "source_amount":{
                                    "currency": "USD",
                                    "units": "1"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "date_of_birth": "2007-05-01",
                          "nationality": "PHL",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL",
                          "legal_name_first": "test sender first name"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "JPN",
                               "segment": "individual",
                               "bank": "0001",
                               "branch": "599",
                               "account_number": "12345678",
                               "legal_name_first": "test recipient first name"
                },
                "compliance":{
                              "source_of_funds": "04",
                              "remittance_purpose": "001-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of C2C create bank account transfer payload with Terrapay partner in only required fields in SEPA instance
    Given call Login API with partner username as "terrapay" and password as "terrapay-password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "terrapay",
      "payload":{
                "destination_amount":{
                                    "currency": "EUR",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "DEU",
                               "segment": "individual",
                               "currency": "EUR",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "swift_code": "DEUTDEMM",
                               "iban": "DE89 3704 0044 0532 0130 00"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of C2C create bank account transfer payload with Xoom partner in only required fields in China instance
    Given call Login API with partner username as "xoom" and password as "xoom_password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "xoom",
      "payload":{
                "destination_amount":{
                                    "currency": "CNY",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "date_of_birth" : "2007-05-01",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "CHN",
                               "segment": "individual",
                               "mobile_number": "+8613087654321",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "account_number": "6217900112345678"
                },
                "compliance":{
                              "remittance_purpose": "003-01"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """


  @validation_api @smoke @validate
  Scenario: Able to validate schema of C2C create bank account transfer payload with WorldRemit partner in only required fields in Singapore instance
    Given call Login API with partner username as "worldremit" and password as "worldremit_password"
    When call Validate Schema API to validate schema "create_transfer" with following payload
    """
    {
      "partner": "worldremit",
      "payload":{
                "destination_amount":{
                                    "currency": "SGD",
                                    "units": "0.01"
                },
                "source":{
                          "type": "partner",
                          "country": "PHL",
                          "segment": "individual",
                          "sender_id": "12345678",
                          "legal_name_first": "test sender first name",
                          "legal_name_last": "test sender last name",
                          "date_of_birth" : "2007-05-01",
                          "address_line": "test sender address",
                          "address_city": "test sender city",
                          "address_country": "PHL"
                },
                "destination":{
                               "type": "bank_account",
                               "country": "SGP",
                               "segment": "individual",
                               "legal_name_first": "test recipient first name",
                               "legal_name_last": "test recipient last name",
                               "address_line": "test recipient address",
                               "address_city": "test recipient city",
                               "swift_code": "ABNASG2A"

                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "valid": true,
        "details": {}
    }
    """