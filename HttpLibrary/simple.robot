*** Settings ***
Library  HttpLibrary.HTTP
Library  String

*** Variables ***   
${AUTH_URL}  http://localhost:8082
${API_URL}  http://localhost:8080

*** Test Cases ***
Oauth With Client Credentials
	Create Http Context  localhost:8082  http

	Set Basic Auth   371d6a05-6297-48d4-b26d-ba8665c50c90  biMoCyeeVYGvNbmthUPy
	Set Request Header  Content-Type  application/x-www-form-urlencoded
    Set Request Body    grant_type=client_credentials
	
	POST  /oauth/token
    
    ${get_status}  Get Response Status
	${get_body}  Get Response Body
	Should Start With  ${get_status}  200
	${json}=  Parse Json  ${get_body}
	Set Suite Variable  ${access_token}  ${ json['access_token']}
	Set Suite Variable  ${token_type}  ${json['token_type']}


PaymentMethods
    GET  ${API_URL}/payment/paymentMethods
	${get_status}  Get Response Status
	${get_body}  Get Response Body
	Should Start With  ${get_status}  200
	${json}=  Parse Json  ${get_body}