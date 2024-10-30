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
        buymore = softwareSystem "Buy More" {
            description "Online Buy More storefront"
            perspectives {
            }
            database = container "Database" {
                description "Shared persistence"
                technology "PostgreSQL"
                tags "tag"
                perspectives {
                }
                orderPlacementSchema = component "Order Placement Schema" {
                    description "Order state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                paymentSchema = component "Payment Schema" {
                    description "Payment state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                fulfillmentSchema = component "Fulfillment Schema" {
                    description "Fulfillment state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                emailSchema = component "E-mail Schema" {
                    description "E-mail state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
                orchestrationSchema = component "Orchestration Schema" {
                    description "Orchestration state"
                    technology "PostgreSQL"
                    perspectives {
                    }
                }
            }
            orderPlacementService = container "Order Placement Service" {
                description "Accepts orders"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                this -> orderPlacementSchema "order data" "Spring Data JDBC" "sync-one-way" {
                }
            }
            paymentService = container "Payment Service" {
                description "Process payments"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                this -> paymentSchema "payment data" "Spring Data JDBC" "sync-one-way" {
                }
            }
            fulfillmentService = container "Fulfillment Service" {
                description "Ships orders"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                this -> fulfillmentSchema "fulfillment data" "Spring Data JDBC" "sync-one-way" {
                }
            }
            emailService = container "E-mail Service" {
                description "E-mail customers"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                this -> emailSchema "e-mail data" "Spring Data JDBC" "sync-one-way" {
                }
            }
            orchestrator = container "Orchestrator" {
                description "Coordinates the workflow, maintains atomic consistency"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                penny -> this "purchase products" "JSON over HTTPS" "sync-one-way" {
                }
                this -> orderPlacementService "accept the order" "JSON over HTTPS" "sync-one-way" {
                }
                this -> paymentService "process the payment" "JSON over HTTPS" "sync-one-way" {
                }
                this -> fulfillmentService "ship the order" "JSON over HTTPS" "sync-one-way" {
                }
                this -> emailService "send the order status" "JSON over HTTPS" "sync-one-way" {
                }
                this -> orchestrationSchema "orchestration data" "Spring Data JDBC" "sync-one-way" {
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

    }
}