global class UspsAddress {
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
}