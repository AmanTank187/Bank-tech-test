# Bank-tech-test

## Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

- Acceptance criteria
- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
- Then she would see

![Screenshot 2021-02-09 at 11 44 54](https://user-images.githubusercontent.com/37899538/107359297-6bd62100-6acc-11eb-864b-c2371fde3b90.png)

---

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

---

## How to run the project

### Follow these steps:

- Git clone this repo
- CD into Bank-tech-test
- run 'Bundle install'
- Open 'IRB'
- require './lib/bank.rb'
- Create a new class in irb e.g. 'newbank = Bank.new'
- Interact with the app by calling deposit , withdraw or show_bank_statement
  - newbank.deposit(400)
  - newbank.withraw(20)
  - newbank.show_bank_statement => bank statement will shown
- Run 'rspec' to see the tests and coverage

![Screenshot 2021-02-09 at 12 17 06](https://user-images.githubusercontent.com/37899538/107362496-bc4f7d80-6ad0-11eb-9613-ba974d24b313.png)

---

## My Approach

When completing this tech test I decided I wanted to complete small tasks at a time with the help of TDD. I would write simple tests and pass them in the easiest way and then refactor the code until I felt it passed my user story.

I kept the code simple and slowly built it up, for example at the start my withdraw and deposit functions could only update the balance but at the point of writing this, they can raise an error if insufficient funds are passed through.

Using the IRB console really helped me with the logic and it would give me an idea of how I wanted my logic to work. When trying to figure out how to display the data to the user I used the IRB to loop over a nested array, doing this enabled me to access the data when I wanted to show the transaction history. 

## My Structure 

The structure is very important to me and I wanted to make sure my code was clean and well-tested, to help me with this I included rubocop and simplecov into my gem files.

To make sure my code was clean I would constantly refactor it to make sure it meets principles such as DRY and SRP. I tried to keep my functions as short as possible and gave my functions and variables clear and descriptive names so the code would be easy to follow along. I felt my code was clear and readable but for some parts of the code that I thought could be hard to follow along, I left a short comment above it explaining what the line did. An example of me refactoring a part of my code is that I decided to use an array for my transaction history and when I needed the data I would get access to it by index, I thought this would be confusing to follow so I decided a hash is better in this situation as you could reach data by key.  I also had a function called current_time which had a date object within it, I only used this function once so I decided to remove it and it was not needed within my code. 

I also feel I can improve much more of my code, such as I have an update balance function. I feel I could be able to remove this function in the future and be able to calculate the balance using the transaction history. So at the moment, I feel there is a possibility of two ways of calculating the balance but I would like to cut it to one to clean up my code more. 
