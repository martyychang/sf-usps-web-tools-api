global class UspsAddressValidateRequest implements XmlSerializable {
	global UspsAddress address { get; set; }
	global Boolean includeOptionalElements { get; set; }
	global Boolean returnCarrierRoute { get; set; }
	
	global UspsAddressValidateRequest() {
		this.address = new UspsAddress();
		this.includeOptionalElements = true;
		this.returnCarrierRoute = true;
	}
	
	global Dom.Document toXml() {
	
		// Initialize the doc and create the root element
		Dom.Document doc = new Dom.Document();
		Dom.XmlNode root = doc.createRootElement(
				'AddressValidateRequest', null, null);
		
		// Add authentication
		root.setAttribute('USERID', UspsSetting__c.getInstance().UserId__c);
		
		// Add the child elements
		Dom.XmlNode includeOptionalElementsEl =
				root.addChildElement('IncludeOptionalElements', null, null);
		XmlUtil.setText(includeOptionalElementsEl, this.includeOptionalElements);

		Dom.XmlNode returnCarrierRouteEl =
				root.addChildElement('ReturnCarrierRoute', null, null);
		XmlUtil.setText(returnCarrierRouteEl, this.returnCarrierRoute);
		
		Dom.XmlNode addressEl = this.address.toXml().getRootElement();
		addressEl.setAttribute('ID', '0');
		root.insertBefore(addressEl, null);
		
		return doc;
	}
}