#Author: giteshivshankar@gmail.com

Feature: User APIs
  I want to use this feature to hit user APIs

	Background:
	* url baseUri = 'https://reqres.in'

  Scenario: List users
    Given url baseUri+'/api/users?page=2'
    When method GET
		Then status 200
		And print 'Response is: ', response
		And print 'Expected email is: ', response.data[1].email
		And assert response.data[1].email=='lindsay.ferguson@reqres.in'
		
		
		Scenario: List one user
    Given url baseUri+'/api/users/2'
    When method GET
		Then status 200
		And print 'Response is: ', response
		And print 'Expected email is: ', response.data.email
		And assert response.data.email=='janet.weaver@reqres.in'
		
		Scenario: List absent user
    Given url baseUri+'/api/users/23'
    When method GET
		Then status 404
		And print 'Response is: ', response
		
		Scenario: Create users
    Given url baseUri+'/api/users'
    When request {"name": "morpheus","job": "leader"}
    And method POST
		Then status 201
		And print 'Response is: ', response
		And assert response.name=='morpheus'
