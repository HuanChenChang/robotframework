*** Settings ***
Library  Collections
Library  ExtendedRequestsLibrary

*** Test Cases ***
Post Request With Client Credentials
	Create Client OAuth2 Session    client    https://sit-accounts.catchplay.com/oauth/token    371d6a05-6297-48d4-b26d-ba8665c50c90    biMoCyeeVYGvNbmthUPy   base_url=https://sit-api.catchplay.com 
	${var} =    Get Request    client    /payment/paymentMethods 
	${json} =  Set Variable  ${var.json()}
	Log    ${var}
    Delete All Sessions