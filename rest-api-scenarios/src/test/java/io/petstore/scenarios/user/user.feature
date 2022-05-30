Feature: User Service

  Background:
    * url baseUrl
    * def user =
      """
       {
         id: '#number',
         username: '#string',
         firstName: '#string',
         lastName: '#string',
         email: '#string',
         password: '#string',
         phone: '#string',
         userStatus: 1
       }
       """

  Scenario Outline: Create user
    * def some = Java.type('util.TestDataGenerator')
    * def randomNumber = some.randomNumber(10, 100000)
    * def userRequestBody =
      """
       {
         id: #(<id>),
         username: #(<username>),
         firstName: #(<firstName>),
         lastName: #(<lastName>),
         email: #(<email>),
         password: #(<password>),
         phone: #(<phone>),
         userStatus: 1
       }
       """

    Given url baseUrl + '/v2/user'
    And request userRequestBody
    When method POST
    Then status <statusCode>
    And match header Content-Type == <responseContentType>
    And match response contains <response>

    Examples:
      | id           | username | firstName    | lastName    | email             | password | phone       | statusCode | responseContentType | response      |
      | randomNumber | 'user1'  | 'firstname1' | 'lastname2' | 'user1@gmail.com' | '123'    | '257182470' | 200        | 'application/json'  | { code: 200 } |


  Scenario Outline: Retrieve user by username <username>
    * def some = Java.type('util.TestDataGenerator')
    * def randomUUID = some.uuid()

    Given url baseUrl + '/v2/user'
    And path <username>
    When method GET
    Then status <statusCode>
    And match header Content-Type == <responseContentType>
    And match response contains <response>

    Examples:
      | username   | statusCode | responseContentType | response                      |
      | 'user1'    | 200        | 'application/json'  | user                          |
      | randomUUID | 404        | 'application/json'  | { message: 'User not found' } |
      | null       | 405        | 'application/xml'   | 'unknown'                     |


  Scenario Outline: Update user
    * def some = Java.type('util.TestDataGenerator')
    * def randomNumber = some.randomNumber(10, 100000)
    * def userUpdateRequestBody =
      """
       {
         id: #(<id>),
         username: #(<username>),
         firstName: #(<firstName>),
         lastName: #(<lastName>),
         email: #(<email>),
         password: #(<password>),
         phone: #(<phone>),
         userStatus: 1
       }
       """

    Given url baseUrl + '/v2/user'
    And path <username>
    And request userUpdateRequestBody
    When method PUT
    Then status <statusCode>
    And match header Content-Type == <responseContentType>
    And match response contains <response>

    Examples:
      | username | id           | username | firstName          | lastName          | email                   | password | phone       | statusCode | responseContentType | response      |
      | 'user1'  | randomNumber | 'user1'  | 'firstname1-modif' | 'lastname2-modif' | 'user1-modif@gmail.com' | '123456' | '257182471' | 200        | 'application/json'  | { code: 200 } |