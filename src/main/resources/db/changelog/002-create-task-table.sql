--liquibase formatted sql
--changeset Murad:002-create-task-table
--preconditions onFail:CONTINUE onError:CONTINUE

CREATE TABLE IF NOT EXISTS task_schema.task (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) NOT NULL,
    priority VARCHAR(50) NOT NULL,
    author_id BIGINT NOT NULL,
    assignee_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_task_author FOREIGN KEY (author_id) REFERENCES task_schema.account (id) ON DELETE CASCADE,
    CONSTRAINT fk_task_assignee FOREIGN KEY (assignee_id) REFERENCES task_schema.account (id) ON DELETE SET NULL
);


