Feature: Ticket queue

  Scenario: Enter the queue
    When tom@acagroup.be enters the queue
    Then tom@acagroup.be is assigned number 1 in the queue

  Scenario: Multiple people enter the queue
    Given tom@acagroup.be is in the queue
    When niels@acagroup.be enters the queue
    Then niels@acagroup.be is assigned number 2 in the queue

  Scenario: Allow people to start buying tickets
    Given niels@acagroup.be is in the queue
    When the registration queue allows 1 person to start buying tickets
    Then niels@acagroup.be is allowed to buy tickets in the ticket service

  Scenario: Allow 0 people to start buying tickets
    Given tom@acagroup.be is in the queue
    When the registration queue allows 0 people to start buying tickets
    Then tom@acagroup.be is not allowed to buy tickets in the ticket service


