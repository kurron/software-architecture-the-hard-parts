package org.kurron.hard.parts.email

import org.springframework.boot.fromApplication
import org.springframework.boot.with


fun main(args: Array<String>) {
	fromApplication<EmailApplication>().with(TestcontainersConfiguration::class).run(*args)
}
