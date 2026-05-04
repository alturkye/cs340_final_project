-- Group 2: Ceina Ellison, Eman Alturky

-----
-- MEMBERS PAGE
-----

-- SELECT: get all member detail to display in the browse table
SELECT * FROM Members;

-- INSERT: add a new member using variables from the web form
INSERT INTO Members (first_name, last_name, email, phone_number, membership_start_date, trainer_id)
VALUES (:first_name_input, :last_name_input, :email_input, :phone_input, :start_date_input, :trainer_id_from_dropdown);

------
-- TRAINERS PAGE
------
-- SELECT: get all trainers to display in the browse table
SELECT * FROM Trainers;

-- INSERT: add a new trainer
INSERT INTO Trainers (first_name, last_name, specialization, hourly_rate)
VALUES (:first_name_input, :last_name_input, :specialization, :hourly_rate_input);
