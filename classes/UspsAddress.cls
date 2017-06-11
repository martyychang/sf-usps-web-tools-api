global class UspsAddress implements XmlSerializable {
	global String address1 { get; set; }
	global String address2 { get; set; }
	global String carrierRoute { get; set; }
	global String city { get; set; }
	global String deliveryPoint { get; set; }
	global String firmName { get; set; }
	global String state { get; set; }
	global String zip4 { get; set; }
	global String zip5 { get; set; }
	
	global UspsAddress() {
		this.address1 = null;
		this.address2 = null;
		this.carrierRoute = null;
		this.city = null;
		this.deliveryPoint = null;
		this.firmName = null;
		this.state = null;
		this.zip4 = null;
		this.zip5 = null;
	}
	
	global Dom.Document toXml() {
	
		// Initialize the doc and create the root element
		Dom.Document doc = new Dom.Document();
		Dom.XmlNode root = doc.createRootElement('Address', null, null);
		
		// Add the child elements
		Dom.XmlNode firmNameEl = root.addChildElement('FirmName', null, null);
		XmlUtil.setText(firmNameEl, this.firmName);

		Dom.XmlNode address1El = root.addChildElement('Address1', null, null);
		XmlUtil.setText(address1El, this.address1);
		
		Dom.XmlNode address2El = root.addChildElement('Address2', null, null);
		XmlUtil.setText(address2El, this.address2);

		Dom.XmlNode cityEl = root.addChildElement('City', null, null);
		XmlUtil.setText(cityEl, this.city);

		Dom.XmlNode stateEl = root.addChildElement('State', null, null);
		XmlUtil.setText(stateEl, this.state);

		Dom.XmlNode zip5El = root.addChildElement('Zip5', null, null);
		XmlUtil.setText(zip5El, this.zip5);

		Dom.XmlNode zip4El = root.addChildElement('Zip4', null, null);
		XmlUtil.setText(zip4El, this.zip4);

		return doc;
	}
}