global class UspsAddressValidateRequest {
	global UspsAddress address { get; set; }
	global Boolean includeOptionalElements { get; set; }
	global Boolean returnCarrierRoute { get; set; }
	
	global UspsAddressValidateRequest() {
		this.address = new UspsAddress();
		this.includeOptionalElements = true;
		this.returnCarrierRoute = true;
	}
}