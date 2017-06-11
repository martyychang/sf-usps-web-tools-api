global class UspsService {
    
    /**
     * Microservice for the Address Information API
     */
    global UspsAddressService address { get; set; }
    
    private static UspsService staticInstance = new UspsService();
    
    global UspsService() {
        this.address = new UspsAddressService();
    }
    
    global static UspsService getInstance() {
    	return staticInstance;
    }
	
	global String serialize(XmlSerializable thing) {
		String content = thing.toXml().toXmlString();
		return content.replace('<?xml version="1.0" encoding="UTF-8"?>', '');
	}
}