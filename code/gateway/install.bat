copy pom.xml %2\pom.xml
cd %2
call mvn apigee:deploy -P %1 -Dappname=%2
del pom.xml 
rmdir target /S /Q
cd ..
