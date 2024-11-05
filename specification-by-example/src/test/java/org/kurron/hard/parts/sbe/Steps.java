package org.kurron.hard.parts.sbe;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Steps {

    private static final Logger logger = LoggerFactory.getLogger(Steps.class);

    @Given("a fully available system")
    public void a_fully_available_system() {
        logger.debug("a_fully_available_system");
    }

    @When("Penny purchases an item")
    public void penny_purchases_an_item() {
        logger.debug("penny_purchases_an_item");
    }

    @Then("then the entire transaction is completed")
    public void then_the_entire_transaction_is_completed() {
        logger.debug("then_the_entire_transaction_is_completed");
    }

    @Given("the {string} service is down")
    public void the_service_is_down(String string) {
        logger.debug("the_service_is_down");
    }

    @Then("then the entire transaction is reverted")
    public void then_the_entire_transaction_is_reverted() {
        logger.debug("then_the_entire_transaction_is_reverted");
    }

    @When("Penny attempts to purchase a previously failed item")
    public void penny_attempts_to_purchase_a_previously_failed_item() {
        logger.debug("penny_attempts_to_purchase_a_previously_failed_item");
    }

    @Then("the workflow resumes from the failed step")
    public void the_workflow_resumes_from_the_failed_step() {
        logger.debug("the_workflow_resumes_from_the_failed_step");
    }
}
