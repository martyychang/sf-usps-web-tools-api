global class UspsAddressService {
	
	global UspsAddressValidateResponse__c validate(UspsAddressValidateRequest__c req) {
		XmlService xml = XmlService.getInstance();
		
		HttpRequest httpReq = new HttpRequest();
		httpReq.setBody(xml.serialize(req));
		
		HttpResponse httpRes = new Http().send(httpReq);
		
		return (UspsAddressValidateResponse__c)xml.deserialize(
				httpRes.getBody(), UspsAddressValidateResponse__c.sobjectType);
	}
}