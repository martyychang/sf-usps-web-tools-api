global class UspsAddressService {
	
	global UspsAddressValidateResponse validate(UspsAddressValidateRequest req) {
		UspsService service = UspsService.getInstance();
		
		HttpRequest httpReq = new HttpRequest();
		// httpReq.setBody();
		
		HttpResponse httpRes = new Http().send(httpReq);
		
		return UspsAddressValidateResponse.newInstance(httpRes.getBody());
	}
}