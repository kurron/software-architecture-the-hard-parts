package org.kurron.hard.parts.fulfillment

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class FulfillmentApplication

fun main(args: Array<String>) {
	runApplication<FulfillmentApplication>(*args)
}
