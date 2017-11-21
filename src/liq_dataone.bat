
@echo off
CLS

set liquibasePath=c:\Program Files\Liquibase
set policyOnePath=d:\Projects\policyone.dataone\OneInc.PolicyOne.DataOne.Liquibase\environments\dev.local


cd /d %policyOnePath%
(
  echo url=jdbc:sqlserver://localhost;databaseName=PolicyOneDDS_Sierra_new
  echo username=policyone
  echo password=policyone
  echo classpath=c:\\Program Files ^(x86^)\\Microsoft SQL Server JDBC Driver 6.0\\sqljdbc42.jar
  echo contexts=""
  echo logLevel=info

) > liquibase.local.properties

java -jar "%liquibasePath%\liquibase.jar" releaselocks
java -jar "%liquibasePath%\liquibase.jar" clearchecksums
java -jar "%liquibasePath%\liquibase.jar" update

PAUSE