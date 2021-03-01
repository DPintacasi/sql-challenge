-- departments information
create table departments(
	dept_no varchar(4) primary key,	
	dept_name varchar not null
);

-- employees information
create table employees(
	emp_no int primary key,
	emp_title_id varchar(5) not null,
	birth_date date,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar(1),
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id)
);

--titles information
create table titles(
	title_id int primary key,
	title varchar
);

--employees in each department information (junction table)
create table dept_emp(
	emp_no int,
	dept_no varchar(4) not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no,dept_no)
);

-- department managers information (junction table )
create table dept_manager(
	dept_no varchar(4),
	emp_no INT not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no,dept_no)
);

--salaries infomration
create table salaries(
	emp_no int not null,
	salary float not null,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no,salary)
);





