Select * from bank_loan_data

--Total Loan Applications
Select count(id) as Total_Loan_Applications 
from bank_loan_data

--MTD Applications
Select count(id) as Total_MTD_Applications 
from bank_loan_data 
where month(issue_date)=12 

--PMTD Applications
Select count(id) as Total_PMTD_Applications 
from bank_loan_data 
where month(issue_date)=11 

--Total Funded amount
Select sum(loan_amount) as Total_Funded_Amount
from bank_loan_data

--MTD Total Funded amount
Select sum(loan_amount) as Total_MTD_Funded_Amount
from bank_loan_data
where month(issue_date)=12

--PMTD Total Funded amount
Select sum(loan_amount) as Total_PMTD_Funded_Amount
from bank_loan_data
where month(issue_date)=11

--Total Amount Received
Select sum(total_payment) AS Total_Amount_Received
from bank_loan_data

--Total MTD Amount Received
Select sum(total_payment) AS Total_MTD_Amount_Received
from bank_loan_data
where month(issue_date)=12

--Total PMTD Amount Received
Select sum(total_payment) AS Total_PMTD_Amount_Received
from bank_loan_data
where month(issue_date)=11

--Average Interest Rate
Select round(avg(int_rate),4)*100 as Avg_Int_Rate 
from bank_loan_data

--MTD Average Interest Rate
Select round(avg(int_rate),4)*100 as MTD_Avg_Int_Rate 
from bank_loan_data
where month(issue_date)=12

--PMTD Average Interest Rate
Select round(avg(int_rate),4)*100 as PMTD_Avg_Int_Rate 
from bank_loan_data
where month(issue_date)=11

--Average DTI
Select round(avg(dti),4)*100 as Avg_DTI 
from bank_loan_data

--MTD Average DTI
Select round(avg(dti),4)*100 as MTD_Avg_DTI
from bank_loan_data
where month(issue_date)=12

--PMTD Average DTI
Select round(avg(dti),4)*100 as PMTD_Avg_DTI 
from bank_loan_data
where month(issue_date)=11

--Good Loan Percentage
Select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100.0)/count(id) as Good_Loan_Percentage
from bank_loan_data

--Good Loan Applications
Select count(id) as Good_Loan_Applications 
from bank_loan_data
where loan_status IN ('Fully Paid','Current')

--Good Loan Funded Amount
Select sum(loan_amount) as Good_Loan_Funded_Amount 
from bank_loan_data
where loan_status IN ('Fully Paid','Current')

--Good Loan Amount Received
Select sum(total_payment) as Good_Loan_Amount_Received 
from bank_loan_data
where loan_status IN ('Fully Paid','Current')


--Bad Loan Percentage
Select (count(case when loan_status='Charged Off' then id end)*100.0)/count(id) as Bad_Loan_Percentage
from bank_loan_data

--Bad Loan Applications
Select count(id) as Bad_Loan_Applications 
from bank_loan_data
where loan_status = 'Charged Off'

--Bad Loan Funded Amount
Select sum(loan_amount) as Bad_Loan_Funded_Amount 
from bank_loan_data
where loan_status = 'Charged Off'

--Bad Loan Amount Received
Select sum(total_payment) as Bad_Loan_Amount_Received 
from bank_loan_data
where loan_status = 'Charged Off'

--Loan Status

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


--Bank Loan Report
--Month
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--State
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

--Term
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

--Employee Length
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

--Purpose
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose

--Home Ownership
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership

--Filter for grade 'A'
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY home_ownership
ORDER BY home_ownership