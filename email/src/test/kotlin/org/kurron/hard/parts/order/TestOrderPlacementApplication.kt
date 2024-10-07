package org.kurron.hard.pats.skeleton

import org.springframework.boot.fromApplication
import org.springframework.boot.with


fun main(args: Array<String>) {
	fromApplication<SkeletonApplication>().with(TestcontainersConfiguration::class).run(*args)
}
