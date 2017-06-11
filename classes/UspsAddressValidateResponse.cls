global class UspsAddressValidateResponse {
	global UspsAddress address { get; set; }
	
	global UspsAddressValidateResponse() {
	    this.address = new UspsAddress();
	}
	
	global static UspsAddressValidateResponse newInstance(String content) {
        
        // Load the XML document
		Dom.Document doc = new Dom.Document();
		doc.load(content);
		Dom.XmlNode root = doc.getRootElement();
		Dom.XmlNode addressNode = root.getChildElement('Address', null);
		
		// Initialize the record
		UspsAddressValidateResponse instance = new UspsAddressValidateResponse();
		
		instance.address.firmName = addressNode.getChildElement('FirmName', null).getText();
		instance.address.address1 = addressNode.getChildElement('Address1', null).getText();
        instance.address.address2 = addressNode.getChildElement('Address2', null).getText();
        instance.address.city = addressNode.getChildElement('City', null).getText();
        instance.address.state = addressNode.getChildElement('State', null).getText();
        instance.address.zip5 = addressNode.getChildElement('Zip5', null).getText();
        instance.address.zip4 = addressNode.getChildElement('Zip4', null).getText();
        instance.address.deliveryPoint = addressNode.getChildElement('DeliveryPoint', null).getText();
        instance.address.carrierRoute = addressNode.getChildElement('CarrierRoute', null).getText();
		
		return instance;
	}
}