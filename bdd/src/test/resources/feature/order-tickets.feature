Feature: Order tickets

  Background:
    Given bdd@acagroup.be is allowed to buy tickets
    And the ticket service makes 999 combi tickets available
    And the ticket service makes 999 day tickets available

  Scenario: Allowed to buy tickets
    Given bdd@acagroup.be is allowed to buy tickets
    Then bdd@acagroup.be has an empty basket

  Scenario: Not allowed to buy tickets
    When evil@acagroup.be is not allowed to buy tickets
    Then evil@acagroup.be has no basket

  Scenario: Add a ticket to the basket
    When bdd@acagroup.be adds a ticket to the basket
    Then The basket of bdd@acagroup.be contains 1 ticket

  Scenario: Add multiple tickets to the basket
    When bdd@acagroup.be adds 2 combi tickets to the basket
    Then The basket of bdd@acagroup.be contains 2 tickets

  Scenario: Add different ticket types to the basket
    When bdd@acagroup.be adds a combi ticket to the basket
    Then The basket of bdd@acagroup.be contains 1 combi ticket

  Scenario: Add different ticket types to the basket
    When bdd@acagroup.be adds a day ticket to the basket
    Then The basket of bdd@acagroup.be contains 1 day ticket

  Scenario: Calculate the total price
    Given combi tickets are priced at 100.00 euro
    When bdd@acagroup.be adds a combi ticket to the basket
    Then The total price of the basket of bdd@acagroup.be is 100.00 euro

  Scenario: Calculate the total price
    Given combi tickets are priced at 100.00 euro
    And day tickets are priced at 70.00 euro
    When bdd@acagroup.be adds a combi ticket to the basket
    When bdd@acagroup.be adds a day ticket to the basket
    Then The total price of the basket of bdd@acagroup.be is 170.00 euro

  Scenario: Remove a ticket from the basket
    Given bdd@acagroup.be adds 2 combi tickets to the basket
    When bdd@acagroup.be removes a combi ticket from the basket
    Then The basket of bdd@acagroup.be contains 1 combi ticket