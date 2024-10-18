# https://github.com/structurizr/dsl/blob/master/docs/language-reference.md

#(Person|SoftwareSystem|Container|Component|DeploymentNode|InfrastructureNode|SoftwareSystemInstance|ContainerInstance|Custom)

!const CODE_NAME "Project Alpha"
!const GROUP_NAME "Group"

/*
multi line
*/

# single line
// single line

workspace "Software Architecture: The Hard Parts (Epic Saga)" "Phone Tag Saga" {
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
            emailService = container "E-mail Service" {
                description "E-mail customers"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                component "E-mail Gateway" {
                    description "Manages communication with public E-mail Services"
                    technology "SMTP"
                    perspectives {
                    }
                    this -> penny "send the order status" "SMTP" "async-one-way" {
                        tag "happy-path"
                    }
                }
            }
            fulfillmentService = container "Fulfillment Service" {
                description "Ships orders"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                component "E-mail Gateway" {
                    description "Manages communication with E-mail Service"
                    technology "JSON over AMQP"
                    perspectives {
                    }
                    this -> emailService "send the order status" "JSON over AMQP" "async-one-way" {
                        tag "happy-path"
                    }
                }
            }
            paymentService = container "Payment Service" {
                description "Process payments"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                component "Fulfillment Gateway" {
                    description "Manages communication with Fulfillment Service"
                    technology "JSON over AMQP"
                    perspectives {
                    }
                    this -> fulfillmentService "ship the order" "JSON over AMQP" "async-one-way" {
                        tag "happy-path"
                    }
                }
            }
            orderPlacementService = container "Order Management Service" {
                description "Accepts orders"
                technology "Spring Ecosystem"
                tags "tag"
                perspectives {
                }
                component "Order Gateway" {
                    description "Manages communication with Order Placement Service"
                    technology "JSON over HTTP"
                    perspectives {
                    }
                    penny -> this "purchase products" "JSON over HTTPS" "sync-one-way" {
                        tag "happy-path"
                    }
                }
                component "Payment Gateway" {
                    description "Manages communication with Payment Service"
                    technology "JSON over AMQP"
                    perspectives {
                    }
                    this -> paymentService "process the payment" "JSON over AMQP" "async-one-way" {
                        tag "happy-path"
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
            relationship "sync-one-way-sad" {
                thickness 2
                style solid
                color #FF0000
            }
            relationship "sync-two-way" {
                thickness 2
                style solid
                color #553D67
            }
        }
    }
}