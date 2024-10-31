package org.kurron.hard.parts.orchestrator

import org.springframework.boot.fromApplication
import org.springframework.boot.with


fun main(args: Array<String>) {
	fromApplication<OrchestrationApplication>().with(OrchestratorTestcontainersConfiguration::class).run(*args)
}
