package org.kurron.hard.parts.orchestrator

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.context.annotation.Import

@Import(OrchestratorTestcontainersConfiguration::class)
@SpringBootTest
class OrchestrationApplicationTests {

	@Test
	fun contextLoads() {
	}

}
