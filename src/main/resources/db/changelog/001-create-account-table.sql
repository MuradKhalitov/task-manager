--liquibase formatted sql
--changeset Murad:001-create-account-table
--preconditions onFail:CONTINUE onError:CONTINUE

CREATE TABLE IF NOT EXISTS task_schema.account (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);


