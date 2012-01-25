cp pom.xml $2
cd $2
mvn apigee:deploy -P $1 -Dappname=$2
rm -fr  pom.xml 
rm  -fr  target 
cd ..
