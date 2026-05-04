-- Group 2: Ceina Ellison, Eman Alturky

-----
-- MEMBERS PAGE
-----

-- SELECT: get all member detail to display in the browse table
SELECT * FROM Members;

-- INSERT: add a new member using variables from the web form
INSERT INTO Members (first_name, last_name, email, phone_number, membership_start_date, trainer_id)
VALUES (:first_name_input, :last_name_input, :email_input, :phone_input, :start_date_input, :trainer_id_from_dropdown);

-- UPDATE: modify a member's information based on the ID selected from the table
UPDATE Members
SET first_name = :first_name_input,
    last_name = :last_name_input,
    email = :email_input,
    phone_number = :phone_input,
    membership_start_date = :start_date_input,
    trainer_id = :trainer_id_from_dropdown
WHERE member_id = :member_id_selected_from_table;

-- DELETE: remove a member from the database
DELETE FROM Members WHERE member_id = :member_id_selected_from_table;

------
-- TRAINERS PAGE
------
-- SELECT: get all trainers to display in the browse table
SELECT * FROM Trainers;

-- INSERT: add a new trainer
INSERT INTO Trainers (first_name, last_name, specialization, hourly_rate)
VALUES (:first_name_input, :last_name_input, :specialization_input, :hourly_rate_input);

-- UPDATE: edit trainer details
UPDATE Trainers
SET first_name = :first_name_input,
    last_name = :last_name_input,
    specialization = :specialization_input,
    hourly_rate = :hourly_rate_input
WHERE trainer_id = :trainer_id_selected_from_table;

-- DELETE: remove a trainer
DELETE FROM Trainers WHERE trainer_id = :trainer_id_selected_from_table;
