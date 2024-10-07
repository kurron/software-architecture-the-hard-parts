package org.kurron.hard.parts.payment

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.context.annotation.Import

@Import(PaymentTestcontainersConfiguration::class)
@SpringBootTest
class PaymentApplicationTests {

	@Test
	fun contextLoads() {
	}

}
