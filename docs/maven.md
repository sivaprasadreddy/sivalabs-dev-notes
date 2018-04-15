# Maven

## Install artifacts into local repository

`mvn install:install-file -DgroupId=oracle -DartifactId=ojdbc14 -Dpackaging=jar -Dversion=1.0 -Dfile=ojdbc14.jar -DgeneratePom=true`

## Commonly used Plugins

### Sonar Maven Plugin

``` xml
<properties>
  <sonar.jdbc.url>jdbc:mysql://localhost:3306/sonar</sonar.jdbc.url>
  <sonar.jdbc.username>sonar</sonar.jdbc.username>
  <sonar.jdbc.password>sonar</sonar.jdbc.password>
  <sonar.host.url>http://localhost:9000</sonar.host.url>
</properties>

<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>sonar-maven-plugin</artifactId>
    <version>2.1</version>
</plugin>
```
