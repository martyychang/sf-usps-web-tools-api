@isTest
private class UspsAddressValidateRequestTest {

	@testSetup
	private static void setup() {
		
		// Create a custom setting
		insert new UspsSetting__c(UserId__c = 'TEST');
	}
    
	/**
	 * Serialize an object that represents the following XML data for
	 * an `AddressValidateRequest`.
	 *
	 * <AddressValidateRequest USERID="XXXXX">
	 *   <IncludeOptionalElements>true</IncludeOptionalElements>
	 *   <ReturnCarrierRoute>true</ReturnCarrierRoute>
	 *   <Address ID="0">  
	 *     <FirmName />   
	 *     <Address1 />   
	 *     <Address2>205 bagwell ave</Address2>   
	 *     <City>nutter fort</City>   
	 *     <State>wv</State>   
	 *     <Zip5></Zip5>   
	 *     <Zip4></Zip4> 
	 *   </Address>      
	 * </AddressValidateRequest>
	 */
	@isTest
	private static void serializeAddressValidateRequest() {
		
		// Validate the given
		UspsAddressValidateRequest req = new UspsAddressValidateRequest();
		req.address.address2 = '205 bagwell ave';
		req.address.city = 'nutter fort';
		req.address.state = 'wv';
		
		// Do the when
		Test.startTest();
		
		String content = req.toXml().toXmlString();
		
		// Validate the then
		Test.stopTest();
		
		String expectedContent = String.join(new List<String> {
			'<?xml version="1.0" encoding="UTF-8"?>',
			'<AddressValidateRequest USERID="TEST">',
			'<IncludeOptionalElements>true</IncludeOptionalElements>',
			'<ReturnCarrierRoute>true</ReturnCarrierRoute>',
			'<Address ID="0">',
			'<FirmName />',
			'<Address1 />',
			'<Address2>205 bagwell ave</Address2>',
			'<City>nutter fort</City>',
			'<State>wv</State>',
			'<Zip5 />',
			'<Zip4 />',
			'</Address>',
			'</AddressValidateRequest>'
		}, '');
		
		System.assertEquals(expectedContent, content);
	}
}