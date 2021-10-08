# SWE645HW2

Kevin Lowery and Alan Boyce SWE 645 Fall 2021 Homework 2

Kevin Lowery's homepage on AWS: http://swe637hw1.s3-website.us-east-2.amazonaws.com/
Alan Boyce's homepage on AWS: http://swe645-a1-part1.s3-website-us-east-1.amazonaws.com/

Note: Due to cloud computing costs, we are not running the web application in Kubernetes continuously in AWS. Our video documents the running service. We'll also show the running application in a live demo of the extra credit.

CONTENTS OF THIS FILE
---------------------
 * Introduction
 * Included Files

INTRODUCTION
------------
For this homework assignment, we developed detailed step by step instructions for 

 1) Containerizing the web application developed in homework 1 and deploying it locally
 2) Deploying the containerized application on Kubernetes using Rancher
 3) Extra Credit - Establishing a CI/CD Pipeline with GitHub and Jenkins

Our steps are thoroughly documented in the included PDF with heavy use of screenshots to make them easy to follow.

We also developed a video that follows the instructional steps and demonstrates the work. 


INCLUDED FILES
------------

readme.txt - This readme file
SWE645HW2.pdf - Detailed step by step instructions
SWE645HW2.mp4 - Video for Parts 1 and 2. Extra credit portion will be shown in a live demo.
Dockerfile - the Dockerfile used to build our image
Jenkinsfile - the Jenkinsfile that defines our build pipeline
survey.war - Web Application Resource file to deploy to the Tomcat App Server
index.html - HTML page for our survey
swe645.css - Cascading Style Sheet used by the survey page
