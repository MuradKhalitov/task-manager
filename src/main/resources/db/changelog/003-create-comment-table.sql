--liquibase formatted sql
--changeset Murad:003-create-comment-table
--preconditions onFail:CONTINUE onError:CONTINUE

CREATE TABLE IF NOT EXISTS task_schema.comment (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    content TEXT NOT NULL,
    author_id BIGINT NOT NULL,
    task_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comment_author FOREIGN KEY (author_id) REFERENCES task_schema.account (id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_task FOREIGN KEY (task_id) REFERENCES task_schema.task (id) ON DELETE CASCADE
);
