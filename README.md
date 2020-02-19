# atlassian-demo

## Run the demo

* Run `./starh.sh` and start containers.
* Open browser and use the following services
  * JIRA Core <https://localhost/jira-core>
  * Confluence <https://localhost/confluence>
  * Crowd <https://localhost/crowd>
* Run `./clean.sh` and clean up containers/volumes.

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
