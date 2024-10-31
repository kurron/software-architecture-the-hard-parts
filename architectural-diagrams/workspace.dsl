# https://github.com/structurizr/dsl/blob/master/docs/language-reference.md

#(Person|SoftwareSystem|Container|Component|DeploymentNode|InfrastructureNode|SoftwareSystemInstance|ContainerInstance|Custom)

!const CODE_NAME "Project Alpha"
!const GROUP_NAME "Group"

/*
multi line
*/

# single line
// single line

workspace "Software Architecture: The Hard Parts (Epic Saga)" "Epic Saga" {
    !identifiers flat
    !impliedRelationships true
   #!include <file|directory|url>

    !docs documents
    !adrs decisions

    !const FOO "Some text you want to reuse."

    model {
        penny = Person "Penny" {
            description "Purchasing customer"
        }
        softwareSystem "Buy Less" {
            description "Another system"
        }
        buymore = softwareSystem "Buy More" {
            description "Online Buy More storefront"
            perspectives {
            }
            orderPlacementService = container "Order Placement Service" {
                description "Accepts orders"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                orderPlacementAPI = component "Order Placement API" {
                    description "Service API"
                    technology "Spring HATEOAS"
                    perspectives {
                    }
                }
                orderPlacementSchema = component "Order Placement Schema" {
                    description "Order state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                component "Order Placement Persistence" {
                    description "Persist Service State"
                    technology "Spring Data JDBC"
                    perspectives {
                    }
                    orderPlacementAPI -> this "order data" "Spring Data JDBC" "sync-one-way" {
                    }
                    this -> orderPlacementSchema "order data" "Spring Data JDBC" "sync-one-way" {
                    }
                }
            }
            paymentService = container "Payment Service" {
                description "Process payments"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                paymentAPI = component "Payment API" {
                    description "Service API"
                    technology "Spring HATEOAS"
                    perspectives {
                    }
                }
                paymentSchema = component "Payment Schema" {
                    description "Payment state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                component "Payment Persistence" {
                    description "Persist Service State"
                    technology "Spring Data JDBC"
                    perspectives {
                    }
                    paymentAPI -> this "payment data" "Spring Data JDBC" "sync-one-way" {
                    }
                    this -> paymentSchema "payment data" "Spring Data JDBC" "sync-one-way" {
                    }
                }
            }
            fulfillmentService = container "Fulfillment Service" {
                description "Ships orders"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                fulfillmentAPI = component "Fulfillment API" {
                    description "Service API"
                    technology "Spring HATEOAS"
                    perspectives {
                    }
                }
                fulfillmentSchema = component "Fulfillment Schema" {
                    description "Fulfillment state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                component "Fulfillment Persistence" {
                    description "Persist Service State"
                    technology "Spring Data JDBC"
                    perspectives {
                    }
                    fulfillmentAPI -> this "fulfillment data" "Spring Data JDBC" "sync-one-way" {
                    }
                    this -> fulfillmentSchema "fulfillment data" "Spring Data JDBC" "sync-one-way" {
                    }
                }
            }
            emailService = container "E-mail Service" {
                description "E-mail customers"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                emailAPI = component "E-Mail API" {
                    description "Service API"
                    technology "Spring HATEOAS"
                    perspectives {
                    }
                }
                emailSchema = component "E-mail Schema" {
                    description "E-mail state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                component "E-Mail Persistence" {
                    description "Persist Service State"
                    technology "Spring Data JDBC"
                    perspectives {
                    }
                    emailAPI -> this "e-mail data" "Spring Data JDBC" "sync-one-way" {
                    }
                    this -> emailSchema "e-mail data" "Spring Data JDBC" "sync-one-way" {
                    }
                }
            }
            orchestrator = container "Orchestrator" {
                description "Coordinates the workflow, maintains atomic consistency"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                orchestratorAPI = component "Orchestrator API" {
                    description "Service API"
                    technology "Spring HATEOAS"
                    perspectives {
                    }
                    penny -> this "purchase products" "JSON over HTTPS" "sync-one-way" {
                    }
                }
                serviceGateway = component "Service Gateway" {
                    description "Service Clients"
                    technology "Spring HATEOAS"
                    perspectives {
                    }
                    orchestratorAPI -> this "execute workflow" "JSON over HTTPS" "sync-one-way" {
                    }
                    this -> orderPlacementAPI "accept the order" "JSON over HTTPS" "sync-one-way" {
                    }
                    this -> paymentAPI "process the payment" "JSON over HTTPS" "sync-one-way" {
                    }
                    this -> fulfillmentAPI "ship the order" "JSON over HTTPS" "sync-one-way" {
                    }
                    this -> emailAPI "send the order status" "JSON over HTTPS" "sync-one-way" {
                    }
                }
                orchestrationSchema = component "Orchestration Schema" {
                    description "Orchestration state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                component "Orchestrator Persistence" {
                    description "Persist Service State"
                    technology "Spring Data JDBC"
                    perspectives {
                    }
                    orchestratorAPI -> this "execute workflow" "JSON over HTTPS" "sync-one-way" {
                    }
                    this -> orchestrationSchema "orchestration data" "Spring Data JDBC" "sync-one-way" {
                    }
                }
            }
       }
    }

    # https://visme.co/blog/website-color-schemes/
    views {
        theme default
        styles {
            element "MessageBroker" {
                shape Cylinder
                background #E8A87C
            }
            element "DataStore" {
                shape Cylinder
                background #E27D60
            }
            element "Cron" {
                shape Robot
            }
            element "FileStore" {
                shape Folder
                background #dac292
            }
            # shape <Box|RoundedBox|Circle|Ellipse|Hexagon|Cylinder|Pipe|Person|Robot|Folder|WebBrowser|MobileDevicePortrait|MobileDeviceLandscape|Component>
            element "Channel" {
                shape Pipe
                background #C38D9E
            }
            element "Channel Adapter" {
                shape Ellipse
                background #41B3A3
            }
            element "Microservice" {
                shape Hexagon
            }
            element "CommandLine" {
                shape Box
            }
            element "WebUI" {
                shape WebBrowser
            }

            relationship "async-one-way" {
                thickness 2
                style dotted
                color #242582
            }
            relationship "sync-one-way" {
                thickness 2
                style solid
                color #0000FF
            }
            relationship "sync-two-way" {
                thickness 2
                style solid
                color #553D67
            }
            relationship "json-over-mongodb-wire-protocol" {
                thickness 2
                style dotted
                color #F64C72
            }
            relationship "jdbc-driver" {
                thickness 2
                style dotted
                color #F64C72
            }
        }
/*
        # from misconception talk
        container buymore {
            include ->database->
        }
        container buymore {
            include ->orderPlacementService->
        }
        container buymore {
            include ->paymentService->
        }
        container buymore {
            include ->fulfillmentService->
        }
        container buymore {
            include ->emailService->
        }
        container buymore {
            include ->orchestrator->
        }
       container buymore {
           include orderPlacementService emailService
       }
*/
    }
}