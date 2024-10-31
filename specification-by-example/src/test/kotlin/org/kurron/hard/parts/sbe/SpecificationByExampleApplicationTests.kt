package org.kurron.hard.parts.sbe

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.context.annotation.Import

@Import(SpecificationByExampleTestcontainersConfiguration::class)
@SpringBootTest
class SpecificationByExampleApplicationTests {

	@Test
	fun contextLoads() {
	}


}
