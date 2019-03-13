Fork of demo-jenkins-config-as-code with a lot of stuff removed
===

init_scripts/src/main/groovy/scripts/Auth.groovy

  this creates an admin user. I have it print a random generated password rather than hardcoding it

init_scripts/src/main/groovy/scripts/DemoFolder.groovy
  
  removed ownership plugin. This still creates the demo folder and loads demo/*.groovy

init_scripts/src/main/groovy/demo/test.groovy

  a sample pipeline 

### Usage

  make build


  make run

