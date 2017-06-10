@isTest
private class XmlServiceTest {

	@testSetup
	private static void setup() {
		
		// Create a custom setting
		insert new UspsSetting__c(UserId__c = 'TEST');
	}
	
	/**
	 * Deserialize XML content for an `AddressValidateResponse` as expected
	 * from a successful request to validate an address.
	 *
     * <?xml version="1.0" encoding="UTF-8"?>
     * <AddressValidateResponse>
     *     <Address ID="0">
     *         <FirmName>SLALOM</FirmName>
     *         <Address1>STE 300</Address1>
     *         <Address2>316 STUART ST</Address2>
     *         <City>BOSTON</City>
     *         <State>MA</State>
     *         <Zip5>02116</Zip5>
     *         <Zip4>5242</Zip4>
     *         <DeliveryPoint>16</DeliveryPoint>
     *         <CarrierRoute>C027</CarrierRoute>
     *     </Address>
     * </AddressValidateResponse>
     */
    @isTest
    private static void deserializeAddressValidateResponse() {
		
		// Validate the given
		String content = String.join(new List<String> {
			'<?xml version="1.0" encoding="UTF-8"?>',
			'<AddressValidateResponse>',
			'    <Address ID="0">',
			'        <FirmName>SLALOM</FirmName>',
			'        <Address1>STE 300</Address1>',
			'        <Address2>316 STUART ST</Address2>',
			'        <City>BOSTON</City>',
			'        <State>MA</State>',
			'        <Zip5>02116</Zip5>',
			'        <Zip4>5242</Zip4>',
			'        <DeliveryPoint>16</DeliveryPoint>',
			'        <CarrierRoute>C027</CarrierRoute>',
			'    </Address>',
			'</AddressValidateResponse>'
		}, '\r\n');
		
		// Do the when
		Test.startTest();
		
		XmlService xml = XmlService.getInstance();
		
		UspsAddressValidateResponse__c res =
				(UspsAddressValidateResponse__c)xml.deserialize(
						content, UspsAddressValidateResponse__c.sobjectType);
		
		// Validate the then
		Test.stopTest();
		
		System.assertEquals('SLALOM', res.Address__r.FirmName__c);
		System.assertEquals('STE 300', res.Address__r.Address1__c);
		System.assertEquals('316 STUART ST', res.Address__r.Address2__c);
		System.assertEquals('BOSTON', res.Address__r.City__c);
		System.assertEquals('MA', res.Address__r.State__c);
		System.assertEquals('02116', res.Address__r.Zip5__c);
		System.assertEquals('5242', res.Address__r.Zip4__c);
		System.assertEquals('16', res.Address__r.DeliveryPoint__c);
		System.assertEquals('C027', res.Address__r.CarrierRoute__c);
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
		UspsAddressValidateRequest__c req = new UspsAddressValidateRequest__c(
				IsIncludeOptionalElements__c = true,
				IsReturnCarrierRoute__c = true,
				Address__r = new UspsAddress__c(
						Address2__c = '205 bagwell ave',
						City__c = 'nutter fort',
						State__c = 'wv'));
		
		// Do the when
		Test.startTest();
		
		XmlService xml = XmlService.getInstance();
		String content = xml.serialize((Sobject)req);
		
		// Validate the then
		Test.stopTest();
		
		String expectedContent = String.join(new List<String> {
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