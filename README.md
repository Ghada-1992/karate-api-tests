# Karate API Tests

An API Testing framework developed using [Karate DSL](https://github.com/karatelabs/karate)

## Getting started

### Prerequisites
* Java v8
* Maven

### Installation
* Clone and install :
    ```
    git clone https://github.com/Ghada-1992/karate-api-tests.git
    cd karate-api-tests
    ``` 
* Run all tests locally :
    ```
    docker-compose up
    ```

-   CI/CD :

  - CI is set up using CircleCI

  - Config for the CI is defined in `.circleci/config.yml`.

  - View the Builds for this repo @ [CircleCI](https://app.circleci.com/pipelines/github/Ghada-1992/karate-api-tests?branch=main)   
    ( **You need to be logged in to your own CircleCI account using your GitHub credentials to view this** )

  - View Cucumber HTML Report under `Artifacts` tab of the Job run


![Alt text](images/cucumber-html-report.png?raw=true "Report Artifacts")
