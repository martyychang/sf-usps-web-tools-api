global class XmlUtil {
	global static Dom.XmlNode setText(Dom.XmlNode node, Object value) {
		if (value != null) {
			node.addTextNode(String.valueOf(value));
		}
		
		return node;
	}
}