# atlassian-demo

* Run `./starh.sh` and start containers.
* Open browser and use the following services
  * JIRA Core <https://localhost/jira-core>
  * Confluence <https://localhost/confluence>
* Run `./clean.sh` and clean up containers/volumes.

# JIRA Core

## Replace server ID

When local DB and volume are recreated, server ID is re-generated. Follow this KB and replace it by the one for trial key:

```
UPDATE propertystring SET propertyvalue = '<ID>'
where id = (
  select id from propertystring where id in (
    select id from propertyentry where PROPERTY_KEY='jira.sid.key'
  )
);
```
