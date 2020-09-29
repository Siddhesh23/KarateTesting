Feature: Verify the API operations for Employee feature

  Background: 
    * url 'http://dummy.restapiexample.com'
    * header Content-Type = 'application/json'

  #Positive Scenarios
  Scenario: verify if the list of all employees has an employee with the name: Gloria along with all her details
    Given path '/api/v1/employees'
    When method get
    Then status 200
    And def userResponse = response
    And match userResponse.data contains {"id":"18","employee_name":"Gloria Little","employee_salary":"237500","employee_age":"59","profile_image":""}

  Scenario: verify the details of Employee with id= 1
    Given path '/api/v1/employee/1'
    When method get
    Then status 200
    And match response == {"status":"success","data":{"id":1,"employee_name":"Tiger Nixon","employee_salary":320800,"employee_age":61,"profile_image":""},"message":"Successfully! Record has been fetched."}

  Scenario: Post data reading payload from Json file and verify the response data
    Given def payload = read(karate.properties['user.dir']+'/src/test/resources/JsonFile/Payload.json')
    And path '/api/v1/create'
    And print 'payload is: ', payload
    And request payload
    When method POST
    Then status 200
    And print response
    And match response == {"status": "success","data": {"id": '#notnull',"employee_name": "Pavel Rudometkin","employee_salary": 399844,"employee_age": 28,"profile_image": null},"message": "Successfully! Record has been added."}

  Scenario: Put data reading payload from Json file and verify the response data
    Given def payload = read(karate.properties['user.dir']+'/src/test/resources/JsonFile/Payload.json')
    And path '/api/v1/update/21'
    And print 'payload is: ', payload
    And request payload
    When method PUT
    Then status 200
    And print response
    And match response == {"status": "success","data": {"id": '#notnull',"employee_name": "Pavel Rudometkin","employee_salary": 399844,"employee_age": 28,"profile_image": null},"message": "Successfully! Record has been updated."}

  Scenario: Delete data and verify the response data
    Given path '/api/v1/delete/9'
    When method DELETE
    Then status 200
    And print response
    And match response == {"status": "success","data": "9","message": "Successfully! Record has been deleted"}

  #Negative Scenarios
  Scenario: verify get method when the employee id passed is blank
    Given path '/api/v1/employee/'
    When method get
    Then status 404

  Scenario: Post data reading payload from Json file containing invalid data for age and verify that the status should not be success
    Given def payload = read(karate.properties['user.dir']+'/src/test/resources/JsonFile/PayloadWithInvalidDataForAge.json')
    And path '/api/v1/create'
    And print 'payload is: ', payload
    And request payload
    When method POST
    Then status 400
    And print response

  Scenario: Put data reading payload from Json file containing invalid data for salary and verify that the status should not be success
    Given def payload = read(karate.properties['user.dir']+'/src/test/resources/JsonFile/PayloadWithInvalidDataForSalary.json')
    And path '/api/v1/update/21'
    And print 'payload is: ', payload
    And request payload
    When method PUT
    Then status 400
    And print response