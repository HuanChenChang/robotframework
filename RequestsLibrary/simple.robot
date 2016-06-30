*** Settings ***
Library  Collections
Library  String
Library  RequestsLibrary
Library  Selenium2Library

*** Variables ***   
${AUTH_URL}  http://localhost:8082
${API_URL}  http://localhost:8080

*** Test Cases ***
Post Request With Client Credentials
	Create Session  httpbin  ${API_URL}
    ${headers}=  Create Dictionary  Authorization=Bearer 108f42f2-dfda-429a-ae6b-7c782e7c6dad
    ${resp}=  Get Request  httpbin  /payment/paymentMethods  headers=${headers}
    ${json} =  Set Variable  ${resp.json()}
    Log    ${json}
    Delete All Sessions