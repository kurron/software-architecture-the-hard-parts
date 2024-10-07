package org.kurron.hard.parts.fulfillment

import org.springframework.boot.fromApplication
import org.springframework.boot.with

fun main(args: Array<String>) {
	fromApplication<FulfillmentApplication>().with(TestcontainersConfiguration::class).run(*args)
}
