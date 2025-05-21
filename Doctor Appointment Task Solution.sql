--- 1. Find the Total Number of Appointments for Each Doctor 
SELECT 
    count(a.appointment_id) as total_number_of_appointment,
	d.first_name,
	d.last_name
FROM
   Appointments a 
JOIN 
   Doctors d ON a.doctor_id = d.doctor_id
GROUP BY
d.first_name,d.last_name;

--- 2. List All Patients Who Have an Appointment with a Specific Doctor (e.g., Dr. John Smith) 
SELECT 
    p.patient_id,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    a.status,
    a.appointment_date
FROM 
    Patients p
JOIN 
    Appointments a ON p.patient_id = a.patient_id
JOIN 
    Doctors d ON a.doctor_id = d.doctor_id
WHERE
    d.first_name = 'John' AND d.last_name = 'Smith';

--- 3. Find the Number of Appointments Scheduled in a Specific Department 
SELECT 
   count(a.appointment_id) as Num_appointment,
   dp.department_id,
   dp.department_name
FROM 
Appointments a
JOIN
Doctors d ON a.doctor_id = d.doctor_id
JOIN
Departments dp ON d.department_id = dp.department_id
WHERE 
department_name = 'Radiology'
GROUP BY 
dp.department_name,dp.department_id

--- 4. Find the Most Popular Specialty Based on Number of Appointments 
SELECT TOP 1
    s.specialty_name,
    COUNT(a.appointment_id) AS appointment_count
FROM 
    Appointments a
JOIN 
    Doctors d ON a.doctor_id = d.doctor_id
JOIN 
    Specialties s ON d.specialty_id = s.specialty_id
GROUP BY 
    s.specialty_name
ORDER BY 
    appointment_count DESC;

--- 5. Get the Total Payment Amount for All Completed Appointments 
SELECT 
   SUM(p.payment_amount) as total_payment_amount,
   a.status
FROM
Payments p
JOIN
Appointments a ON p.appointment_id = a.appointment_id
WHERE 
status = 'Completed'
GROUP BY 
a.status 

--- 6. Find the Number of Patients Seen by Each Doctor
SELECT
    Count(a.patient_id) as num_patients,
	d.first_name,
	d.last_name
FROM
Appointments a 
JOIN
Doctors d  ON a.doctor_id = d.doctor_id
GROUP BY 
d.first_name,d.last_name,d.doctor_id

--- 7. List All Patients Who Have Missed Their Appointments (Status 'Cancelled') 
SELECT 
  p.first_name,
  p.last_name,
  p.patient_id,
  a.status
FROM 
Patients p
JOIN
Appointments a ON p.patient_id = a.patient_id
WHERE
status = 'Cancelled'
GROUP BY 
a.status,p.first_name,p.last_name,p.patient_id;

--- 8.  Find the Total Number of Appointments for Each Status (Scheduled, Completed, Cancelled) 
SELECT 
count(appointment_id) as total_appointment,
status
FROM
Appointments
GROUP BY
status
Order By
total_appointment

--- 9. Get the Average Payment Amount for Completed Appointments 
SELECT
a.appointment_id,
a.status,
avg(p.payment_amount) as avg_amount
FROM
Appointments a
JOIN
Payments p  ON a.appointment_id = p.payment_id
WHERE 
a.status = 'Completed'
GROUP BY 
p.payment_amount,a.appointment_id,a.status

--- 10.  Find the Doctor with the Highest Number of Appointments 
SELECT TOP 1
d.first_name,
d.last_name,
count(a.appointment_id) as total_appointment
FROM
Doctors d
JOIN
Appointments a ON a.doctor_id = d.doctor_id
GROUP BY
d.first_name,d.last_name
ORDER BY
total_appointment DESC;










