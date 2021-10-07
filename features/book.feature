#------------------------------
# Checking Books rules (see {Handbook, v.2021-02-19, p.49})
# JMB - 2021
#------------------------------
# language: en
Feature: Book mutual references
    The books should follow the mutual references rules.

Scenario: The Environment book must not refer to the Goals and Project books
    Given The Environment book
    Then No reference should include the Goals book     
    And No reference should include the Project book 
    And Only E.5 section can refer to the System book

Scenario: The Goals book must not refer to the Project and System books
    Given The Goals book
    Then No reference should include the Project book     
    And No reference should include the System book 

Scenario: The System book must not refer to the Project book
    Given The System book
    Then No reference should include the Project book     
