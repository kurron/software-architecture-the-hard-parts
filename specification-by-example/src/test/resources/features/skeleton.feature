Ability: Onboard Pipeline application

  Scenario: Health Checking
  Newly onboarded Pipeline application are expected to have an integration test against the /health endpoint.

    Given a running application
    When the health check is hit
    Then a successful HTTP status code is returned

