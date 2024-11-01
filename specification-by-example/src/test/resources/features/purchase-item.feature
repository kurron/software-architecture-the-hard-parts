Ability: Purchase Item

  Scenario: Purchase An Item (fully available system)
  Penny wants to purchase an item from the site with a fully available system.

    Given a fully available system
    When Penny purchases an item
    Then then the entire transaction is completed

  Scenario Outline: Purchase An Item (partially available system)
  Penny wants to purchase an item from the site but one of the services is down.

    Given the "<service>" service is down
    When Penny purchases an item
    Then then the entire transaction is reverted

  Examples: possible failing services
    |service        |
    |e-mail         |
    |fulfillment    |
    |orchestrator   |
    |order-placement|
    |payment        |

  Scenario: Purchase An Item (retry failed purchase)
  Penny wants to purchase an item but gets a message stating that there was a problem and that she should try again. When she submits the shopping cart for a second time, the system should successfully complete the transaction.

    Given a fully available system
    When Penny attempts to purchase a previously failed item
    Then then the entire transaction is completed

