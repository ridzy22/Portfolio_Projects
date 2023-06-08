# Personal Loan Modeling using Logistic Regression and Decision Trees

## Context:
Thera Bank is a US bank that has a growing customer base. The majority of these customers are liability customers (depositors) with varying sizes of deposits. The number of customers who are also borrowers (asset customers) is quite small, and the bank is interested in expanding this base rapidly to bring in more loan business and in the process, they wish to earn more through the interest on loans. In particular, the management wants to explore ways of converting its liability customers to personal loan customers (while retaining them as depositors).

A campaign that the bank ran last year for liability customers showed a healthy conversion rate of over 9% success. This has encouraged the retail marketing department to devise campaigns with better target marketing to increase the success ratio.

As a Data scientist at Thera Bank, I have to build a model that will help the marketing department to identify the potential customers who have a higher probability of purchasing the loan.

## Motivation:
To understand Logistic Regression and Decision Trees and explore these algorthims using Sklearn, Statmodel, ROC-AUC curve, Precision curve, Sequential feature selection, Hyperparamter tuning and Post pruning.

## Dataset:
1. ID: Customer ID
2. Age: Customer’s age in completed years
3. Experience: #years of professional experience
4. Income: Annual income of the customer (in thousand dollars)
5. ZIP Code: Home address ZIP code
6. Family: Family size of the customer
7. CCAvg: Average spending on credit cards per month (in thousand dollars)
8. Education: Education Level. 1: Undergrad; 2: Graduate; 3: Advanced/Professional
9. Mortgage: Value of house mortgage if any (in thousand dollars)
10. Personal_Loan: Did this customer accept the personal loan offered in the last campaign?
11. Securities_Account: Does the customer have a securities account with the bank?
12. CD_Account: Does the customer have a certificate of deposit (CD) account with the bank?
13. Online: Do customers use internet banking facilities?
14. CreditCard: Does the customer use a credit card issued by any other bank (excluding All life Bank)?

## Problem Statement:
1. To predict whether a liability customer will buy a personal loan or not
2. Which variables are the most significant
3. Which segment of customers should be targeted more
4. Does age have any impact on the customer borrowing a loan or not
5. Do people with less income borrow loans
