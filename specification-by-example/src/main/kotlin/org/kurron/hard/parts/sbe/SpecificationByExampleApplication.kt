package org.kurron.hard.parts.sbe

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SpecificationByExampleApplication

fun main(args: Array<String>) {
	runApplication<SpecificationByExampleApplication>(*args)
}
