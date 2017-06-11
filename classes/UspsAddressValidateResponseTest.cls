@isTest
private class UspsAddressValidateResponseTest {

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
		
		UspsAddressValidateResponse res =
				UspsAddressValidateResponse.newInstance(content);
		
		// Validate the then
		Test.stopTest();
		
		System.assertEquals('SLALOM', res.address.firmName);
		System.assertEquals('STE 300', res.address.address1);
		System.assertEquals('316 STUART ST', res.address.address2);
		System.assertEquals('BOSTON', res.address.city);
		System.assertEquals('MA', res.address.state);
		System.assertEquals('02116', res.address.zip5);
		System.assertEquals('5242', res.address.zip4);
		System.assertEquals('16', res.address.deliveryPoint);
		System.assertEquals('C027', res.address.carrierRoute);
    }
}