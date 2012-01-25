uristores = messageContext.variables["allowed-uri"]
urimatch = messageContext.variables["_flow.msgvar.clientId"]

index = uristores.find(urimatch)
messageContext.variables["index"] = index
