CREATE DATABASE IF NOT EXISTS DEPLOY_SERVER;

USE DEPLOY_SERVER;

CREATE TABLE IF NOT EXISTS DEPLOY_HISTORY
(
    ID             INT AUTO_INCREMENT PRIMARY KEY,
    DEPLOY_STAGE   VARCHAR(15),
    DEPLOY_STATE   VARCHAR(15),
    SCENARIO_NAME  VARCHAR(100),
    BUILD_TARGET   VARCHAR(100),
    DEPLOY_FROM    VARCHAR(50),
    DEPLOY_TO      VARCHAR(50),
    EXECUTION_DATE DATETIME
);

CREATE TABLE IF NOT EXISTS SSH_CONFIG
(
    ID                 INT AUTO_INCREMENT PRIMARY KEY,
    HOST               VARCHAR(100),
    HOST_NAME          VARCHAR(255),
    IDENTITY_FILE_NAME VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS SCM_INFO
(
    ID                    INT AUTO_INCREMENT PRIMARY KEY,
    SCM_TYPE              VARCHAR(100),
    SCM_INFO_ALIAS        VARCHAR(255),
    USERNAME              VARCHAR(255),
    PERSONAL_ACCESS_TOKEN VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS SCM
(
    ID                 INT AUTO_INCREMENT PRIMARY KEY,
    SCM_INFO_ALIAS     VARCHAR(255),
    SCM_ALIAS          VARCHAR(255),
    REPOSITORY_SSH_URL VARCHAR(255),
    IS_PRIVATE         BOOLEAN
);

CREATE TABLE IF NOT EXISTS REMOTE_SERVER
(
    ID                  INT AUTO_INCREMENT PRIMARY KEY,
    REMOTE_SERVER_ALIAS VARCHAR(255),
    REMOTE_IP           VARCHAR(255),
    PUBLIC_KEY          VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ACCESS_KEY
(
    USER_NAME              VARCHAR(255),
    PERSONAL_ACCESS_TOEKEN VARCHAR(255),
    SCM_INFO_ALIAS         VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS REPOSITORIES
(
    REPOSITORY_ALIAS   VARCHAR(255),
    SCM_ALIAS          VARCHAR(255),
    REPOSITORY_SSH_URL VARCHAR(255),
    IS_PRIVATE         BOOLEAN
);

CREATE TABLE IF NOT EXISTS JENKINS_INFO
(
    ID                 INT AUTO_INCREMENT PRIMARY KEY,
    JENKINS_ID         VARCHAR(40),
    JENKINS_USER_ID    VARCHAR(255),
    JENKINS_PASSWORD   VARCHAR(255),
    JENKINS_IP_ADDRESS VARCHAR(20),
    JENKINS_PORT       varchar(10)
);