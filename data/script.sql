CREATE TABLE address
(
  id       INT AUTO_INCREMENT
    PRIMARY KEY,
  street   VARCHAR(255) NOT NULL,
  city     VARCHAR(100) NOT NULL,
  province VARCHAR(100) NULL,
  country  VARCHAR(100) NOT NULL,
  postcode VARCHAR(50)  NOT NULL,
  CONSTRAINT id_UNIQUE
  UNIQUE (id)
)
  ENGINE = InnoDB;

CREATE TABLE employee
(
  id        INT AUTO_INCREMENT
    PRIMARY KEY,
  firstName VARCHAR(255)    NOT NULL,
  lastName  VARCHAR(255)    NOT NULL,
  salary    DECIMAL(10, 2)  NOT NULL,
  startDate DATE            NOT NULL,
  endDate   DATE            NULL,
  managerId INT DEFAULT '0' NOT NULL,
  addressId INT DEFAULT '0' NOT NULL,
  CONSTRAINT id_UNIQUE
  UNIQUE (id),
  CONSTRAINT manager_id
  FOREIGN KEY (managerId) REFERENCES employee (id),
  CONSTRAINT address_id
  FOREIGN KEY (addressId) REFERENCES address (id)
)
  ENGINE = InnoDB;

CREATE INDEX manager_id_idx
  ON employee (managerId);

CREATE INDEX address_id_idx
  ON employee (addressId);

CREATE TABLE phone
(
  id          INT AUTO_INCREMENT
    PRIMARY KEY,
  type        VARCHAR(20)  NOT NULL,
  phoneNumber VARCHAR(255) NOT NULL,
  areaCode    VARCHAR(255) NOT NULL,
  onwerId     INT          NOT NULL,
  CONSTRAINT id_UNIQUE
  UNIQUE (id),
  CONSTRAINT owner_id
  FOREIGN KEY (onwerId) REFERENCES employee (id)
)
  ENGINE = InnoDB;

CREATE INDEX owner_id_idx
  ON phone (onwerId);

CREATE TABLE project
(
  id       INT AUTO_INCREMENT
    PRIMARY KEY,
  type     VARCHAR(50)    NOT NULL,
  name     VARCHAR(255)   NOT NULL,
  budget   DECIMAL(16, 2) NOT NULL,
  leaderId INT            NOT NULL,
  CONSTRAINT id_UNIQUE
  UNIQUE (id),
  CONSTRAINT leader_id
  FOREIGN KEY (leaderId) REFERENCES employee (id)
)
  ENGINE = InnoDB;

CREATE INDEX leader_id_idx
  ON project (leaderId);

CREATE TABLE projectemployee
(
  projectId INT NOT NULL,
  employeID INT NOT NULL,
  PRIMARY KEY (projectId, employeID),
  CONSTRAINT projectId_UNIQUE
  UNIQUE (projectId),
  CONSTRAINT employeID_UNIQUE
  UNIQUE (employeID),
  CONSTRAINT project_id
  FOREIGN KEY (projectId) REFERENCES project (id),
  CONSTRAINT employee_id
  FOREIGN KEY (employeID) REFERENCES employee (id)
)
  ENGINE = InnoDB;


