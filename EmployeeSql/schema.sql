-- Table Schemas
CREATE TABLE "employee" (
    "emp_no" INT NOT NULL,
    "emp_title" VARCHAR(5) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(64) NOT NULL,
    "last_name" VARCHAR(64) NOT NULL,
    "sex" CHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY ("emp_no")
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4) NOT NULL,
    "dept_name" VARCHAR(64) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "dept_emp" (
    "dept_emp_id" INT PRIMARY KEY AUTO_INCREMENT,
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL,
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employee" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_manager_id" INT PRIMARY KEY AUTO_INCREMENT,
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employee" ("emp_no")
);

CREATE TABLE "salaries" (
    "salary_id" INT PRIMARY KEY AUTO_INCREMENT,
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employee" ("emp_no")
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5) NOT NULL,
    "title" VARCHAR(64) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);
