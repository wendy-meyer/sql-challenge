-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/5KCZAt
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE "Salaries";

CREATE TABLE "Salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

SELECT * FROM "Salaries";

DROP TABLE "Titles";

CREATE TABLE "Titles" (
    "emp_no" Integer   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

SELECT * FROM "Titles";

DROP TABLE "Dept_Emp";

CREATE TABLE "Dept_Emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

SELECT * FROM "Dept_Emp";


DROP TABLE "Dept_Manager";

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);

SELECT * FROM "Dept_Manager";


DROP TABLE "Employees";

CREATE TABLE "Employees" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);
SELECT * FROM "Employees";


DROP TABLE "Departments";

CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);
SELECT * FROM "Departments";

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");


