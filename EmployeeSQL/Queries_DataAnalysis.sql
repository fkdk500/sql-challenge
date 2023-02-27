
--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees as e
inner join salaries as s ON 
s.emp_no = e.emp_no
order by emp_no ASC;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select e.first_name,e.last_name,e.hire_date
from employees as e
WHERE DATE_PART('year',hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select *
from departments
select m.dept_no,d.dept_name,m.emp_no,e.last_name,e.first_name
from dept_managers as m
left join departments as d on
d.dept_no=m.dept_no
left join employees as e on
e.emp_no=m.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e 
inner join dept_emp as de on 
e.emp_no=de.emp_no
inner join departments as d on
d.dept_no=de.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select e.first_name,e.last_name,e.sex
from employees as e
where e.first_name='Hercules'and e.last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no,e.last_name,e.first_name
from employees as e
inner join dept_emp on
dept_emp.emp_no=e.emp_no
inner join departments as d on
d.dept_no=dept_emp.dept_no
where d.dept_name in ('Sales');

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
inner join dept_emp on
dept_emp.emp_no=e.emp_no
inner join departments as d on
d.dept_no=dept_emp.dept_no
where d.dept_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, COUNT(*) AS "frequency_counts"
FROM employees as e
GROUP BY e.last_name
ORDER BY "frequency_counts" DESC;