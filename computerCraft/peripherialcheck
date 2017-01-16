list = peripheral.call("interfaceName", "getMethods") -- replace interfaceName with proper name of reactor component reported in your chat log when you activated its modem
file = fs.open("methods", "w")
file.write(textutils.serialize(list))
file.close()