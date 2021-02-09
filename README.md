# Bank-tech-test

## Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

* Acceptance criteria
* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
* Then she would see

![Screenshot 2021-02-09 at 11 44 54](https://user-images.githubusercontent.com/37899538/107359297-6bd62100-6acc-11eb-864b-c2371fde3b90.png)

---------------------

## User Stories 

As a user\
So i can save money\
I'd like to be able to make a deposit

![Screenshot 2021-02-09 at 11 54 11](https://user-images.githubusercontent.com/37899538/107360218-8957ba80-6acd-11eb-9e2b-875b88534f0c.png)

As a user\
So i can buy some clothes\
I'd like to withdraw my money

![Screenshot 2021-02-09 at 11 56 12](https://user-images.githubusercontent.com/37899538/107360415-d045b000-6acd-11eb-9eec-a204a1eb077a.png)

As a user\
So i can track my spendings\
I'd like to see my transaction history

![Screenshot 2021-02-09 at 12 09 01](https://user-images.githubusercontent.com/37899538/107361634-9b3a5d00-6acf-11eb-921c-55507b9e673b.png)

---------------------

## How to run the project 

### Follow these steps:

* Git clone this repo
* CD into Bank-tech-test
* run 'Bundle install'
* Open 'IRB'
* require './lib/bank.rb' 
* Create a new class in irb e.g. 'newbank = Bank.new' 
* Interact with the app by calling deposit , withdraw or show_bank_statement\
  - newbank.deposit(400)
  - newbank.withraw(20)
  - newbank.show_bank_statement => bank statement will shown
* Run 'rspec' to see the tests and coverage 

![Screenshot 2021-02-09 at 12 17 06](https://user-images.githubusercontent.com/37899538/107362496-bc4f7d80-6ad0-11eb-9613-ba974d24b313.png)

