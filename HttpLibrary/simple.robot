*** Settings ***
Resource  common.txt
Library  Collections
Library  HttpLibrary.HTTP
Library  String

Test Setup  OAUTH BY CLIENT CREDENTIALS

*** Test Cases ***
PaymentMethods
	Create Http Context  ${HOST}:${API_PORT}  ${SCHEMA}
	Set Request Header  Authorization    ${AUTH_TYPE} ${AUTH_TOKEN}
    GET  /payment/paymentMethods
	${get_status}  Get Response Status
	${get_body}  Get Response Body
	Should Start With  ${get_status}  200
	${json}=  Parse Json  ${get_body}