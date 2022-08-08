Feature: Smoke tests for Search Schema APIs


  @validation_api @smoke @search
  Scenario Outline: Able to search validation schema rule with no payload field with <partner_type>
    Given call Login API with partner username as "<partner_user_name>" and password as "<partner_password>"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "<partner_user_name>"
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
      "$schema": "https://json-schema.org/draft/2020-12/schema",
      "type": "object",
      "required": [
        "source",
        "destination",
        "compliance"
      ],
      "properties": {
        "source": {
          "$ref": "#/$defs/source"
        },
        "destination": {
          "$ref": "#/$defs/destination"
        },
        "compliance": {
          "$ref": "#/$defs/compliance"
        },
        "source_amount": {
          "$ref": "#/$defs/source_amount"
        },
        "destination_amount": {
          "$ref": "#/$defs/destination_amount"
        }
      },
      "allOf": [
        {
          "anyOf": [
            {
              "required": [
                "source_amount"
              ],
              "not": {
                "required": [
                  "destination_amount"
                ]
              }
            },
            {
              "required": [
                "destination_amount"
              ],
              "not": {
                "required": [
                  "source_amount"
                ]
              }
            }
          ]
        }
      ],
      "$defs": {
        "source": {
          "type": "object",
          "required": [
            "sender_id",
            "segment"
          ],
          "dependentRequired": {
            "id_number": [
              "id_type"
            ]
          },
          "properties": {
            "sender_id": {
              "$ref": "#/$defs/sender_id"
            },
            "segment": {
              "$ref": "#/$defs/source_segment"
            },
            "legal_name_first": {
              "$ref": "#/$defs/source_legal_name_first"
            },
            "legal_name_last": {
              "$ref": "#/$defs/source_legal_name_last"
            },
            "company_name": {
              "$ref": "#/$defs/source_company_name"
            },
            "date_of_birth": {
              "$ref": "#/$defs/source_date_of_birth"
            },
            "id_type": {
              "$ref": "#/$defs/source_id_type"
            },
            "id_number": {
              "$ref": "#/$defs/source_id_number"
            }
          },
          "allOf": [
            {
              "type": "object",
              "required": [
                "legal_name_first",
                "legal_name_last"
              ]
            }
          ]
        },
        "destination": {
          "type": "object",
          "required": [
            "country"
          ],
          "properties": {
            "country": {
              "$ref": "#/$defs/destination_country"
            },
            "partner": {
              "$ref": "#/$defs/destination_partner"
            }
          }
        },
        "compliance": {
          "type": "object",
          "required": [
            "source_of_funds"
          ],
          "properties": {
            "source_of_funds": {
              "$ref": "#/$defs/source_of_funds"
            }
          }
        },
        "source_amount": {
          "type": "object",
          "required": [
            "units",
            "currency"
          ],
          "properties": {
            "units": {
              "$ref": "#/$defs/source_units"
            },
            "currency": {
              "$ref": "#/$defs/source_currency"
            }
          }
        },
        "destination_amount": {
          "type": "object",
          "properties": {
            "units": {
              "$ref": "#/$defs/destination_units"
            }
          }
        },
        "destination_units": {
          "type": "string",
          "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
        },
        "source_units": {
          "type": "string",
          "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
        },
        "source_currency": {
          "type": "string"
        },
        "source_of_funds": {
          "type": "string"
        },
        "destination_country": {
          "type": "string"
        },
        "destination_partner": {
          "type": "string"
        },
        "sender_id": {
          "type": "string"
        },
        "source_segment": {
          "type": "string",
          "enum": [
            "individual",
            "business"
          ]
        },
        "source_legal_name_first": {
          "type": "string"
        },
        "source_legal_name_last": {
          "type": "string"
        },
        "source_company_name": {
          "type": "string"
        },
        "source_date_of_birth": {
          "type": "string",
          "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
        },
        "source_id_type": {
          "type": "string",
          "enum": [
            "national",
            "passport"
          ]
        },
        "source_id_number": {
          "type": "string"
        }
      }
    }
    """

    Examples:
      | partner_type | partner_user_name | partner_password     |
      | B2B          | B2B_Partner       | B2B_Partner_P4ssw0rd |
      | C2C          | C2C_Partner       | C2C_Partner_P4ssw0rd |


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for general C2C partner
    Given call Login API with partner username as "C2C_Partner" and password as "C2C_Partner_P4ssw0rd"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "C2C_Partner",
      "payload": {
                "source":{
                        "segment": "individual"
                },
                "destination":{
                         "segment": "individual",
                         "country": "SGP"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for McTransfast partner
    Given call Login API with partner username as "mctransfast" and password as "mctransfast_password"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "mctransfast",
      "payload": {
                "source":{
                        "segment": "individual"
                },
                "destination":{
                         "segment": "individual",
                         "country": "CHN"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for Terrapay partner
    Given call Login API with partner username as "terrapay" and password as "terrapay_password>"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "terrapay",
      "payload": {
                "source":{
                        "segment": "Individual"
                },
                "destination":{
                         "segment": "Individual",
                         "country": "SGP"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for Xoom partner
    Given call Login API with partner username as "xoom" and password as "xoom_password>"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "xoom",
      "payload": {
                "source":{
                        "segment": "Individual"
                },
                "destination":{
                         "segment": "Individual",
                         "country": "SGP"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for WorldRemit partner
    Given call Login API with partner username as "<worldremit" and password as "<worldremit_password>"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "worldremit",
      "payload": {
                "source":{
                        "segment": "Individual"
                },
                "destination":{
                         "segment": "Individual",
                         "country": "SGP"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for general B2B partner
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload": {
                "source":{
                        "segment": "Business"
                },
                "destination":{
                         "segment": "Business",
                         "country": "SGP"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for general B2B partner
    Given call Login API with partner username as "B2B_Partner" and password as "B2B_Partner_P4ssw0rd"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "B2B_Partner",
      "payload": {
                "source":{
                        "segment": "Business"
                },
                "destination":{
                         "segment": "Business",
                         "country": "SGP"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """


  @validation_api @smoke @search
  Scenario: Able to search validation schema rule with payload field for McTransfast partner
    Given call Login API with partner username as "mctransfast" and password as "mctransfast_password"
    When call Search Schema API to search schema "create_transfer" with following payload
    """
    {
      "partner": "mctransfast",
      "payload": {
                "source":{
                        "segment": "Business"
                },
                "destination":{
                         "segment": "Business",
                         "country": "SGP"
                }
      }
    }
    """
    Then the response status code will be "200"
    And the response data will be
    """
    {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$defs": {
            "destination_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/destination_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/destination_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "destination_currency": {
                "type": "string"
            },
            "destination_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source_amount": {
                "type": "object",
                "properties": {
                    "units": {
                        "$ref": "#/$defs/source_units"
                    },
                    "currency": {
                        "$ref": "#/$defs/source_currency"
                    }
                },
                "required": [
                    "units",
                    "currency"
                ]
            },
            "source_currency": {
                "type": "string"
            },
            "source_units": {
                "type": "string",
                "pattern": "^[+-]?\\d*(([,.]\\d{3})+)?([,.]\\d+)?([eE][+-]?\\d+)?$"
            },
            "source": {
                "type": "object",
                "properties": {
                    "sender_id": {
                        "$ref": "#/$defs/sender_id"
                    },
                    "segment": {
                        "$ref": "#/$defs/source_segment"
                    },
                    "legal_name_first": {
                        "$ref": "#/$defs/source_legal_name_first"
                    },
                    "legal_name_last": {
                        "$ref": "#/$defs/source_legal_name_last"
                    },
                    "company_name": {
                        "$ref": "#/$defs/source_company_name"
                    },
                    "date_of_birth": {
                        "$ref": "#/$defs/source_date_of_birth"
                    },
                    "id_type": {
                        "$ref": "#/$defs/source_id_type"
                    },
                    "id_number": {
                        "$ref": "#/$defs/source_id_number"
                    }
                },
                "required": [
                    "sender_id",
                    "segment",
                    "legal_name_first",
                    "legal_name_last"
                ],
                "dependentRequired": {
                    "id_number": [
                        "id_type"
                    ]
                }
            },
            "source_id_number": {
                "type": "string"
            },
            "source_id_type": {
                "type": "string",
                "enum": [
                    "national",
                    "passport"
                ]
            },
            "source_date_of_birth": {
                "type": "string",
                "pattern": "^(\\d{4})-(\\d{2})-(\\d{2})$"
            },
            "source_company_name": {
                "type": "string"
            },
            "source_legal_name_last": {
                "type": "string"
            },
            "source_legal_name_first": {
                "type": "string"
            },
            "source_segment": {
                "type": "string",
                "enum": [
                    "individual",
                    "business"
                ]
            },
            "sender_id": {
                "type": "string"
            }
        },
        "type": "object",
        "properties": {
            "source": {
                "$ref": "#/$defs/source"
            },
            "source_amount": {
                "$ref": "#/$defs/source_amount"
            },
            "destination_amount": {
                "$ref": "#/$defs/destination_amount"
            }
        },
        "required": [
            "source"
        ],
        "anyOf": [
            {
                "required": [
                    "source_amount"
                ],
                "not": {
                    "required": [
                        "destination_amount"
                    ]
                }
            },
            {
                "required": [
                    "destination_amount"
                ],
                "not": {
                    "required": [
                        "source_amount"
                    ]
                }
            }
        ]
    }
    """