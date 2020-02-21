# atlassian-demo

## Run the demo

* Run `./starh.sh` and start containers.
* Open browser and use the following services
  * JIRA Core <https://localhost/jira-core>
  * Confluence <https://localhost/confluence>
  * Crowd <https://localhost/crowd>
* Run `./clean.sh` and clean up containers/volumes.

## Configuration notes

### Crowd

* You need Crowd Data Center license to use SSO.
* You need to use `http://atlassian-demo-crowd:8095/crowd/` for Crown server URL in applications (e.g., JIRA, Confluence).
* You need to use docker container name for application remote address in Crowd (e.g., `atlassian-demo-jira-core`).
* You need to add groups from applications (e.g., `jira-core-users`, `jira-administrators`) and add users to them.

### JIRA

* Where is server.xml?

```
/opt/atlassian/etc/server.xml.j2
/opt/atlassian/jira/conf/server.xml
```

### SMTP server for debugging

Use the following values and tail container logs for debugging. No mail is actually send out.
* Host:	atlassian-demo-python-smtpd
* SMTP Port: 25

## Replace server ID

When local DB and volume are recreated, server ID is re-generated. Follow these KBs and replace it by the one for trial key. Remember restart docker container after service ID is updated.

### JIRA Core

* <https://confluence.atlassian.com/jirakb/change-the-server-id-for-an-instance-of-jira-server-285839562.html>

```
UPDATE propertystring SET propertyvalue = '<ID>'
where id = (
  select id from propertystring where id in (
    select id from propertyentry where PROPERTY_KEY='jira.sid.key'
  )
);
```

### Confluence

* <https://confluence.atlassian.com/confkb/how-to-change-the-server-id-of-confluence-211649693.html>

```  
* Replace Server ID in "/var/atlassian/application-data/confluence/confluence.cfg.xml".
```

### Crowd

* <https://confluence.atlassian.com/crowd/important-directories-and-files-78676537.html#Importantdirectoriesandfiles-Shareddirectory>

```  
* Replace Server ID in "/var/atlassian/application-data/crowd/shared/crowd.cfg.xml".
```

## Application links

### Use unproxied application link

For avoiding a lot of issues behind reverse proxy, we need to add a new connector (with different port number, e.g., 8081) in `server.xml` for JIRA and Confluence:

```
<Connector
    port="8081"
    connectionTimeout="20000"
    maxThreads="200"
    minSpareThreads="10" 
    enableLookups="false"
    acceptCount="10"
    URIEncoding="UTF-8"
    relaxedPathChars="[]|"
    relaxedQueryChars="[]|{}^\`&quot;&lt;&gt;" />
```

Use the following values in "Remote application URL":

|Application URL|Display URL|
|---|---|
|`http://atlassian-demo-confluence:8081/confluence`|`https://localhost/confluence`|
|`http://atlassian-demo-jira-core:8081/jira-core`|`https://localhost/jira-core`|

Refer to the following KBs for details:
* <https://confluence.atlassian.com/kb/how-to-bypass-a-reverse-proxy-or-ssl-in-application-links-719095724.html>
* <https://confluence.atlassian.com/kb/how-to-create-an-unproxied-application-link-719095740.html>
