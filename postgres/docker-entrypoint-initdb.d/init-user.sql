CREATE USER crowd;
ALTER USER crowd password 'atlassian';
CREATE DATABASE crowd;
GRANT ALL PRIVILEGES ON DATABASE crowd TO crowd;

CREATE USER jiracore;
ALTER USER jiracore password 'atlassian';
CREATE DATABASE jiracore;
GRANT ALL PRIVILEGES ON DATABASE jiracore TO jiracore;

CREATE USER confluence;
ALTER USER confluence password 'atlassian';
CREATE DATABASE confluence;
GRANT ALL PRIVILEGES ON DATABASE confluence TO confluence;
