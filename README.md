# DNS Monitor
####A suite of scripts to monitor DNS behaviours of newly registered domains
----
#### Fetch
- Fetch newly registerd .com domains from domain punch

#### Clean Data
- Clean newly fetched malicious domains
- Sort and merge malicous domains with newly registered domains
- Filter out newly activated malicious domains

#### IP rotation check
- Query IP addresses from A records of domains every 1 hour

#### Split Deploy
- Split up newly registered domains to file chuncks
- Deploy to 10 planet lab nodes (with respect to nodes in node-list)
	- Install bind-utils and jwhois on planetlab nodes
	- Run processes to query resource records with respect to list of domains in node files

#### Repo Man
- Aggregate resource records from all the planet lab nodes (with respect to nodes in node-list)




