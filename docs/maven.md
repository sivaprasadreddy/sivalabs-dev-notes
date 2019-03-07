# Maven

## Install artifacts into local repository

`mvn install:install-file -DgroupId=oracle -DartifactId=ojdbc14 -Dpackaging=jar -Dversion=1.0 -Dfile=ojdbc14.jar -DgeneratePom=true`

## Commonly used Plugins

### spring-boot-maven-plugin

<https://docs.spring.io/spring-boot/docs/current/maven-plugin/index.html>

```xml
<plugin>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-maven-plugin</artifactId>
  <version>2.1.3.RELEASE</version>
  <configuration>
      <mainClass>${start-class}</mainClass>
      <classifier>exec</classifier>
  </configuration>
  <executions>
    <execution>
      <goals>
        <goal>repackage</goal>
      </goals>
    </execution>
    <execution>
        <goals>
            <goal>build-info</goal>
        </goals>
    </execution>
  </executions>
</plugin>
```

### kotlin-maven-plugin

<https://kotlinlang.org/docs/reference/using-maven.html>

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.jetbrains.kotlin</groupId>
            <artifactId>kotlin-maven-plugin</artifactId>
            <version>${kotlin.version}</version>
            <executions>
                <execution>
                    <id>compile</id>
                    <goals> <goal>compile</goal> </goals>
                    <configuration>
                        <sourceDirs>
                            <sourceDir>${project.basedir}/src/main/kotlin</sourceDir>
                            <sourceDir>${project.basedir}/src/main/java</sourceDir>
                        </sourceDirs>
                    </configuration>
                </execution>
                <execution>
                    <id>test-compile</id>
                    <goals> <goal>test-compile</goal> </goals>
                    <configuration>
                        <sourceDirs>
                            <sourceDir>${project.basedir}/src/test/kotlin</sourceDir>
                            <sourceDir>${project.basedir}/src/test/java</sourceDir>
                        </sourceDirs>
                    </configuration>
                </execution>
            </executions>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.5.1</version>
            <executions>
                <!-- Replacing default-compile as it is treated specially by maven -->
                <execution>
                    <id>default-compile</id>
                    <phase>none</phase>
                </execution>
                <!-- Replacing default-testCompile as it is treated specially by maven -->
                <execution>
                    <id>default-testCompile</id>
                    <phase>none</phase>
                </execution>
                <execution>
                    <id>java-compile</id>
                    <phase>compile</phase>
                    <goals> <goal>compile</goal> </goals>
                </execution>
                <execution>
                    <id>java-test-compile</id>
                    <phase>test-compile</phase>
                    <goals> <goal>testCompile</goal> </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```
### maven-surefire-plugin

<https://maven.apache.org/surefire/maven-surefire-plugin/>

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-surefire-plugin</artifactId>
    <version>3.0.0-M3</version>
    <configuration>
      <excludes>
        <exclude>**/*IntegrationTest.class</exclude>
      </excludes>
    </configuration>
</plugin>
```



### maven-failsafe-plugin

<https://maven.apache.org/surefire/maven-failsafe-plugin/>

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-failsafe-plugin</artifactId>
    <version>3.0.0-M3</version>
    <configuration>
      <includes>
        <include>**/*IntegrationTest.class</include>
      </includes>
    </configuration>
</plugin>
```

### jacoco-maven-plugin

<https://www.eclemma.org/jacoco/trunk/doc/maven.html>

```xml
<project>
    <properties>
     <jacoco.destFile>${project.build.directory}/coverage-reports/aggregate.exec</jacoco.destFile>
    </properties>
    
    <plugin>
        <groupId>org.jacoco</groupId>
        <artifactId>jacoco-maven-plugin</artifactId>
        <version>0.8.3</version>
        <configuration>
            <dataFile>${project.build.directory}/coverage-reports/aggregate.exec</dataFile>
            <rules>
                <rule implementation="org.jacoco.maven.RuleConfiguration">
                    <element>BUNDLE</element>
                    <limits>
                        <limit implementation="org.jacoco.report.check.Limit">
                            <counter>COMPLEXITY</counter>
                            <value>COVEREDRATIO</value>
                            <minimum>0.40</minimum>
                        </limit>
                    </limits>
                </rule>
            </rules>
            <excludes>
                <exclude>**/model/*</exclude>
                <exclude>**/entity/*</exclude>
                <exclude>**/config/*</exclude>
            </excludes>
        </configuration>
        <executions>
            <execution>
                <id>default-prepare-agent</id>
                <goals>
                    <goal>prepare-agent</goal>
                </goals>
                <configuration>
                    <destFile>${project.build.directory}/coverage-reports/jacoco-ut.exec</destFile>
                </configuration>
            </execution>
            <execution>
                <id>default-prepare-agent-integration</id>
                <goals>
                    <goal>prepare-agent-integration</goal>
                </goals>
                <configuration>
                    <destFile>${project.build.directory}/coverage-reports/jacoco-it.exec</destFile>
                </configuration>
            </execution>
            <execution>
                <id>post-unit-test</id>
                <phase>prepare-package</phase>
                <goals>
                    <goal>report</goal>
                </goals>
                <configuration>
                    <dataFile>${project.build.directory}/coverage-reports/jacoco-ut.exec</dataFile>
                    <outputDirectory>${project.reporting.outputDirectory}/jacoco-ut</outputDirectory>
                </configuration>
            </execution>
            <execution>
                <id>post-integration-test</id>
                <phase>post-integration-test</phase>
                <goals>
                    <goal>report</goal>
                </goals>
                <configuration>
                    <dataFile>${project.build.directory}/coverage-reports/jacoco-it.exec</dataFile>
                    <outputDirectory>${project.reporting.outputDirectory}/jacoco-it</outputDirectory>
                </configuration>
            </execution>
            <execution>
                <id>merge-results</id>
                <phase>verify</phase>
                <goals>
                    <goal>merge</goal>
                </goals>
                <configuration>
                    <fileSets>
                        <fileSet>
                            <directory>${project.build.directory}/coverage-reports</directory>
                            <includes>
                                <include>*.exec</include>
                            </includes>
                        </fileSet>
                    </fileSets>
                    <destFile>${project.build.directory}/coverage-reports/aggregate.exec</destFile>
                </configuration>
            </execution>
            <execution>
                <id>post-merge-report</id>
                <phase>verify</phase>
                <goals>
                    <goal>report</goal>
                </goals>
                <configuration>
                    <dataFile>${project.build.directory}/coverage-reports/aggregate.exec</dataFile>
                    <outputDirectory>${project.reporting.outputDirectory}/jacoco-aggregate</outputDirectory>
                </configuration>
            </execution>
    
            <execution>
                <id>check</id>
                <goals>
                    <goal>check</goal>
                </goals>
            </execution>
        </executions>
    </plugin>
</project>
```
### dependency-check-maven
<https://jeremylong.github.io/DependencyCheck/index.html>

```xml
<plugin>
    <groupId>org.owasp</groupId>
    <artifactId>dependency-check-maven</artifactId>
    <version>3.3.2</version>
    <configuration>
        <failOnError>false</failOnError>
    </configuration>
    <executions>
        <execution>
            <phase>deploy</phase>
            <goals>
                <goal>check</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

### maven-dependency-versions-check-plugin
<https://github.com/ning/maven-dependency-versions-check-plugin>

```xml
<plugin>
    <groupId>com.ning.maven.plugins</groupId>
    <artifactId>maven-dependency-versions-check-plugin</artifactId>
    <version>2.0.4</version>
    <configuration>
        <skip>false</skip>
        <failBuildInCaseOfConflict>false</failBuildInCaseOfConflict>
        <warnIfMajorVersionIsHigher>true</warnIfMajorVersionIsHigher>
    </configuration>
    <executions>
        <execution>
            <phase>verify</phase>
            <goals>
                <goal>check</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```
### flyway-maven-plugin
<https://flywaydb.org/documentation/maven/>

```xml

<project>
    <properties>
     <flyway.url>jdbc:postgresql://localhost:5432/postgres</flyway.url>
     <flyway.user>postgres</flyway.user>
     <flyway.password>secret</flyway.password>
    </properties>
    
    <plugin>
        <groupId>org.flywaydb</groupId>
        <artifactId>flyway-maven-plugin</artifactId>
        <configuration>
            <driver>org.postgresql.Driver</driver>
            <url>${flyway.url}</url>
            <user>${flyway.user}</user>
            <password>${flyway.password}</password>
            <schemas>
                <schema>public</schema>
            </schemas>
            <locations>
                <location>classpath:/db/migration/postgresql</location>
            </locations>
        </configuration>
    </plugin>
</project>
```
### maven-antrun-plugin
<http://maven.apache.org/plugins/maven-antrun-plugin/>

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-antrun-plugin</artifactId>
    <version>1.8</version>
    <executions>
        <execution>
            <id>ktlint</id>
            <phase>verify</phase>
            <configuration>
                <target name="ktlint">
                    <java taskname="ktlint" dir="${basedir}" fork="true" failonerror="false"
                      classpathref="maven.plugin.classpath" classname="com.github.shyiko.ktlint.Main">
                        <arg value="src/**/*.kt"/>
                        <!-- to generate report in checkstyle format prepend following args: -->

                        <arg value="--reporter=plain"/>
                        <arg value="--reporter=checkstyle,output=${project.build.directory}/ktlint.xml"/>

                        <!-- see https://github.com/shyiko/ktlint#usage for more -->
                    </java>
                </target>
            </configuration>
            <goals><goal>run</goal></goals>
        </execution>
        <execution>
            <id>ktlint-format</id>
            <phase>validate</phase>
            <configuration>
                <target name="ktlint">
                    <java taskname="ktlint" dir="${basedir}" fork="true" failonerror="false"
                      classpathref="maven.plugin.classpath" classname="com.github.shyiko.ktlint.Main">
                        <arg value="-F"/>
                        <arg value="src/**/*.kt"/>
                    </java>
                </target>
            </configuration>
            <goals><goal>run</goal></goals>
        </execution>
    </executions>
    <dependencies>
        <dependency>
            <groupId>com.github.shyiko</groupId>
            <artifactId>ktlint</artifactId>
            <version>0.29.0</version>
        </dependency>
        <!-- additional 3rd party ruleset(s) can be specified here -->
    </dependencies>
</plugin>
```

### detekt-maven-plugin
<https://github.com/Ozsie/detekt-maven-plugin>

```xml
<plugin>
    <groupId>com.github.ozsie</groupId>
    <artifactId>detekt-maven-plugin</artifactId>
    <version>1.0.0.RC9.2</version>
    <executions>
        <execution>
            <phase>verify</phase>
            <goals><goal>check</goal></goals>
        </execution>
    </executions>
</plugin>
```
### maven-resources-plugin
<https://maven.apache.org/plugins/maven-resources-plugin/>

```xml
<plugin>
    <artifactId>maven-resources-plugin</artifactId>
    <executions>
        <execution>
            <id>copy frontend content</id>
            <phase>generate-resources</phase>
            <goals>
                <goal>copy-resources</goal>
            </goals>
            <configuration>
                <outputDirectory>${project.build.directory}/classes/static</outputDirectory>
                <overwrite>true</overwrite>
                <resources>
                    <resource>
                        <directory>${project.basedir}/../frontend/dist</directory>
                        <includes>
                            <include>static/</include>
                            <include>index.html</include>
                            <include>favicon.ico</include>
                        </includes>
                    </resource>
                </resources>
            </configuration>
        </execution>
    </executions>
</plugin>
```

### Sonar Maven Plugin
<https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Maven>

```xml
<propject>
    <properties>
      <sonar.jdbc.url>jdbc:mysql://localhost:3306/sonar</sonar.jdbc.url>
      <sonar.jdbc.username>sonar</sonar.jdbc.username>
      <sonar.jdbc.password>sonar</sonar.jdbc.password>
      <sonar.host.url>http://localhost:9000</sonar.host.url>
      <sonar.host.url>https://sonarcloud.io</sonar.host.url>
      <sonar.organization>sivaprasadreddy-github</sonar.organization>
    </properties>
    
    <plugin>
        <groupId>org.sonarsource.scanner.maven</groupId>
        <artifactId>sonar-maven-plugin</artifactId>
        <version>3.5.0.1254</version>
        <executions>
            <execution>
                <phase>verify</phase>
                <goals>
                    <goal>sonar</goal>
                </goals>
            </execution>
        </executions>
    </plugin>
</propject>
```

`mvn clean verify sonar:sonar`

### docker-maven-plugin
<https://github.com/fabric8io/docker-maven-plugin>

```xml
<plugin>
    <groupId>io.fabric8</groupId>
    <artifactId>docker-maven-plugin</artifactId>
    <version>0.24.0</version>
    <configuration>
        <logStdout>true</logStdout>
        <images>
            <image>
                <name>postgres:10.3</name>
                <alias>postgresdb</alias>
                <run>
                    <env>
                        <POSTGRES_DB>mydb</POSTGRES_DB>
                        <POSTGRES_USER>siva</POSTGRES_USER>
                        <POSTGRES_PASSWORD>secret</POSTGRES_PASSWORD>
                    </env>
                    <ports>
                        <port>5432</port>
                    </ports>
                    <wait>
                        <log>database system is ready to accept connections</log>
                        <time>30000</time>
                    </wait>
                </run>
            </image>
            <image>
                <name>jamesdbloom/mockserver:mockserver-4.1.0</name>
                <alias>mockserver</alias>
                <run>
                    <ports>
                        <port>1080</port>
                    </ports>
                    <wait>
                        <log>MockServer started</log>
                        <time>30000</time>
                    </wait>
                </run>
            </image>
        </images>
    </configuration>
    <executions>
        <execution>
            <id>start-dependencies</id>
            <phase>pre-integration-test</phase>
            <goals>
                <goal>start</goal>
            </goals>
        </execution>
        <execution>
            <id>stop-dependencies</id>
            <phase>post-integration-test</phase>
            <goals>
                <goal>stop</goal>
                <goal>remove</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

### git-commit-id-plugin

```xml
<plugin>
    <groupId>pl.project13.maven</groupId>
    <artifactId>git-commit-id-plugin</artifactId>
    <version>2.2.2</version>
    <executions>
        <execution>
            <goals>
                <goal>revision</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <dateFormat>yyyy-MM-dd'T'HH:mm:ssZ</dateFormat>
        <generateGitPropertiesFile>true</generateGitPropertiesFile>
    </configuration>
</plugin>
```

### maven-javadoc-plugin

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-javadoc-plugin</artifactId>
    <configuration>
        <sourceFileExcludes>
            <exclude>**/generated/**</exclude>
        </sourceFileExcludes>
    </configuration>
    <executions>
        <execution>
            <id>attach-javadocs</id>
            <phase>package</phase>
            <goals>
                <goal>jar</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

### maven-enforcer-plugin
<https://maven.apache.org/enforcer/maven-enforcer-plugin/>

### maven-compiler-plugin
### protobuf-maven-plugin
### build-helper-maven-plugin
### properties-maven-plugin
### jooq-codegen-maven
### maven-checkstyle-plugin
### exec-maven-plugin

