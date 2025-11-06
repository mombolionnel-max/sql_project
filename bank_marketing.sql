use bank_marketing;
SELECT * FROM bank_full;

ALTER TABLE bank_full
ADD COLUMN client_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

SELECT * FROM bank_full;

CREATE TABLE `client` (
`client_id` int AUTO_INCREMENT,
`age` int not null,
`job` char(20),
`marital_status` char(20),
`education` char(20),
PRIMARY KEY (`client_id`),
FOREIGN KEY (`client_id`) REFERENCES bank_full(`client_id`)
);

CREATE TABLE account_info (
`client_id` INT not null,
`balance` INT,
`personal_loan` char(4),
`housing_loan` char(4),
`default` char(3),
PRIMARY KEY (`client_id`),
FOREIGN KEY (`client_id`) REFERENCES bank_full(`client_id`)
);

CREATE TABLE campaign (
`client_id` INT not null,
`contact` char(20),
`day` INT,
`month` varchar(10),
`duration` INT,
`number_of_contacts` INT,
`pdays` INT,
`previous` INT,
`poutcomes` char(10),
PRIMARY KEY (`client_id`),
FOREIGN KEY (`client_id`) REFERENCES bank_full(`client_id`)
);

INSERT INTO campaign (
    client_id,
    contact,
    day,
    month,
    duration,
    number_of_contacts,
    pdays,
    previous,
    poutcomes
)
SELECT
	client_id,
    contact,
    day,
    month,
    duration,
    campaign,
    pdays,
    previous,
    poutcome
FROM bank_full;

INSERT INTO `client` (
    client_id,
    age,
    job,
    marital_status,
    education
)
SELECT
	client_id,
    age,
    job,
    marital,
    education
FROM bank_full;

INSERT INTO account_info (
    client_id,
    balance,
    personal_loan,
    housing_loan,
    `default`
)
SELECT
    client_id,
    balance,
    loan,
    housing,
    `default`
FROM bank_full;


SELECT * FROM bank_full;
SELECT * FROM account_info;
SELECT * FROM campaign;
SELECT * FROM client;