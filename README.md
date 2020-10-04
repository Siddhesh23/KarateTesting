# KarateTesting
Project on Karate framework

As mentioned all requisites followed:
1) Framework used:Karate
2) Test report generation tool used: Cucumber
3) Build Tool: Maven
4) Language: Java

The testcases can be run by executing them on Maven: mvn clean test <Maven goals
After the execution of all testcases, the Cucumber reports would be generated under cucumber-html-reports folder


Creation of the framework:
The framework has been created with naming conventions as per organisation standards:
for example: feature file and other resources like Json file are under src/test/resources package with proper naming
The project has relative paths used for specifying the location of json files, hence can work on any machine.

1) The automated test suite has been created to test all operations of APIS such as GET, POST, PUT and DELETE for employee feature
2) The POST and PUT operations read the payload only from the .json file (under src/test/resources package) as required
3) Both positive and negative testcases have been covered

Jenkins:
The project is integerated into Jenkins.
The Global Tool Configurations for JDK (11.0.7) and Maven (3.6.3) have been set accordingly
The configurtations for sending email notifications to email id: jenkinsemailtest2020@gmail.com done in Configure System
Also, Jenkins pipeline has been created for the following jobs:
1) Compile 2) Test 3) Generate Cucumber reports 4) Send Email Notifications
The pipeline has been scheduled for daily basis twice from 7am to 12noon
The Jenkinsfile for pipeline code has been checked into the project

