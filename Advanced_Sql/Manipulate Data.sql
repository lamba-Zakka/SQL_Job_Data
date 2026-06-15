-- Create command
CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

-- insert command 
INSERT INTO job_applied(
    job_id,application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status)
VALUES();
-- alter command
ALTER TABLE job_applied
add contact VARCHAR(50);

-- update command 
UPDATE job_applied
set contact = 'Erlich Bachman'
where job_id = 1;

-- rename command 
ALTER TABLE job_applied
Rename contact to contact_name;

-- Changing Data Type 
ALTER TABLE job_applied
alter column contact_name type int;

-- Drop command 
ALTER TABLE job_applied 
DROP contact_name ;

-- drop table command 
Drop table job_applied;