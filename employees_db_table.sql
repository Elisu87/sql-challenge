CREATE TABLE "Departments" (
    "dept_id" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_id"
     )
);

SELECT * FROM "Departments";

CREATE TABLE "Dept_emp" (
    "emp_id" VARCHAR   NOT NULL,
    "dept_id" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "emp_id","dept_id"
     )
);

SELECT * FROM "Dept_emp";

CREATE TABLE "Dept_manager" (
    "dept_id" VARCHAR   NOT NULL,
    "emp_id" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "dept_id","emp_id"
     )
);


SELECT * FROM "Dept_manager";

CREATE TABLE "Employees" (
    "emp_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_id"
     )
);
SELECT * FROM "Employees";

CREATE TABLE "Salaries" (
    "emp_id" VARCHAR   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

SELECT * FROM  "Salaries";

CREATE TABLE "Employees_Title" (
    "title_id" SERIAL PRIMARY KEY,
    "emp_id" VARCHAR   NOT NULL,
    "title_name" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "uc_Employees_Title_title_id" UNIQUE (
        "title_id"
     )
);
SELECT * FROM  "Employees_Title";

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("emp_id");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("emp_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("emp_id");

ALTER TABLE "Employees_Title" ADD CONSTRAINT "fk_Employees_Title_emp_id" FOREIGN KEY("emp_id")
REFERENCES "Employees" ("emp_id");