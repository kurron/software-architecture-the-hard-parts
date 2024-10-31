package org.kurron.hard.parts.sbe

import org.springframework.boot.fromApplication
import org.springframework.boot.with


fun main(args: Array<String>) {
	fromApplication<SpecificationByExampleApplication>().with(SpecificationByExampleTestcontainersConfiguration::class).run(*args)
}
