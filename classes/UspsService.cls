global class UspsService {
    
    /**
     * Microservice for the Address Information API
     */
    global UspsAddressService address { get; set; }
    
    global UspsService() {
        this.address = new UspsAddressService();
    }
}