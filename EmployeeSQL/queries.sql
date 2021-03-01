-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees e
join salaries s on
e.emp_no = s.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.

select e.first_name,e.last_name,e.hire_date
from employees e
where hire_date >= '1986-01-01' and hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager dm
left join departments d on d.dept_no = dm.dept_no
left join employees e on e.emp_no = dm.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select de.emp_no,e.last_name,e.first_name,d.dept_name 
from dept_emp de
join departments d on d.dept_no = de.dept_no
join employees e on e.emp_no = de.emp_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de 
join departments d on d.dept_no = de.dept_no
join employees e on e.emp_no = de.emp_no
where d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de 
join departments d on d.dept_no = de.dept_no
join employees e on e.emp_no = de.emp_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as "Total Number" 
from employees
group by last_name
order by "Total Number" desc;

-- Epilogue query ;)
select e.first_name,e.last_name,t.title 
from employees e 
join titles t on t.title_id = e.emp_title_id
where emp_no = 499942;
