global class XmlService {

	private static Map<String, XmlService> staticInstanceMap =
			new Map<String, XmlService>();

	global XmlService(String name) {
		
	}
	
	global Sobject deserialize(String content, Schema.SObjectType t) {
		Sobject record = null;
		
		if (t == UspsAddressValidateResponse__c.sobjectType) {
			record = this.deserializeUspsAddressValidateResponse(content);
		}
		
		return record;
	}
	
	private Sobject deserializeUspsAddressValidateResponse(String content) {
		Dom.Document doc = new Dom.Document();
		doc.load(content);
		Dom.XmlNode root = doc.getRootElement();
		Dom.XmlNode addressNode = root.getChildElement('Address', null);
		
		// Initialize the record
		UspsAddress__c address = new UspsAddress__c(
				FirmName__c = addressNode.getChildElement('FirmName', null).getText(),
				Address1__c = addressNode.getChildElement('Address1', null).getText(),
				Address2__c = addressNode.getChildElement('Address2', null).getText(),
				City__c = addressNode.getChildElement('City', null).getText(),
				State__c = addressNode.getChildElement('State', null).getText(),
				Zip5__c = addressNode.getChildElement('Zip5', null).getText(),
				Zip4__c = addressNode.getChildElement('Zip4', null).getText(),
				DeliveryPoint__c = addressNode.getChildElement('DeliveryPoint', null).getText(),
				CarrierRoute__c = addressNode.getChildElement('CarrierRoute', null).getText());
		
		UspsAddressValidateResponse__c record =
				new UspsAddressValidateResponse__c(
						Address__r = address);
		
		return record;
	}
	
	global static XmlService getInstance() {
		return getInstance('DEFAULT');
	}
	
	global static XmlService getInstance(String name) {
		if (!staticInstanceMap.containsKey(name)) {
			staticInstanceMap.put(name, new XmlService(name));
		}
		
		return staticInstanceMap.get(name);
	}
	
	global String serialize(Sobject record) {
		String content = null;
		
		if (record.getSObjectType() == UspsAddressValidateRequest__c.sobjectType) {
			content = this.serialize((UspsAddressValidateRequest__c)record);
		}
		
		return content.replace('<?xml version="1.0" encoding="UTF-8"?>', '');
	}
	
	private String serialize(UspsAddressValidateRequest__c record) {
		return this.convert(record).toXmlString();
	}
	
	private Dom.Document convert(UspsAddressValidateRequest__c record) {
	
		// Initialize the doc and create the root element
		Dom.Document doc = new Dom.Document();
		Dom.XmlNode root = doc.createRootElement(
				'AddressValidateRequest', null, null);
		
		// Add authentication
		root.setAttribute('USERID', UspsSetting__c.getInstance().UserId__c);
		
		// Add the child elements
		Dom.XmlNode child = null;
		
		child = root.addChildElement('IncludeOptionalElements', null, null);
		child.addTextNode(String.valueOf(record.IsIncludeOptionalelements__c));
		
		child = root.addChildElement('ReturnCarrierRoute', null, null);
		child.addTextNode(String.valueOf(record.IsReturnCarrierRoute__c));
		
		child = this.convert(record.Address__r).getRootElement();
		child.setAttribute('ID', '0');
		root.insertBefore(child, null);
		
		return doc;
	}
	
	private Dom.Document convert(UspsAddress__c record) {
	
		// Initialize the doc and create the root element
		Dom.Document doc = new Dom.Document();
		Dom.XmlNode root = doc.createRootElement(
				'Address', null, null);
		
		// Add the child elements
		Dom.XmlNode child = null;
		
		child = root.addChildElement('FirmName', null, null);
		if (record.FirmName__c != null) {
			child.addTextNode(record.FirmName__c);
		}
		
		child = root.addChildElement('Address1', null, null);
		if (record.Address1__c != null) {
			child.addTextNode(record.Address1__c);
		}
		
		child = root.addChildElement('Address2', null, null);
		if (record.Address2__c != null) {
			child.addTextNode(record.Address2__c);
		}

		child = root.addChildElement('City', null, null);
		if (record.City__c != null) {
			child.addTextNode(record.City__c);
		}

		child = root.addChildElement('State', null, null);
		if (record.State__c != null) {
			child.addTextNode(record.State__c);
		}

		child = root.addChildElement('Zip5', null, null);
		if (record.Zip5__c != null) {
			child.addTextNode(record.Zip5__c);
		}

		child = root.addChildElement('Zip4', null, null);
		if (record.Zip4__c != null) {
			child.addTextNode(record.Zip4__c);
		}

		return doc;
	}
}