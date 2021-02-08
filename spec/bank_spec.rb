require 'bank'

describe Bank do
    #Using this day variables to pass in as a date argument for the deposit and withdraw functions 
    day = '14/01/2012' 
    day_two = '18/01/2012'
    day_three = '24/01/2012'

    it 'Is an instance of the bank class' do
        expect(subject).to be_instance_of (Bank)
    end 
    describe 'get_balance' do
        it 'It has a balance of 0 when the class is made' do
            newBank = Bank.new 
            expect(newBank.balance).to eq 0
        end 
    end 

    describe 'deposit' do
        it 'Depositing 500 will make the balance change to 500' do
            subject.deposit(day,500.0)
            expect(subject.balance).to eq 500.0
            expect(subject.transaction_history).to eq ([['14/01/2012',500.0,500.0]])
        end 
    end 

    describe 'withdraw' do

        it 'Will raise an error if the withdrawal amount is more than the balance' do
            expect { subject.withdraw(day,100) }.to raise_error 'Not enough funds'
        end 

        it 'Withdrawing 1500 from a balance of 1500 will change the balance to 0' do
            subject.deposit(day,1500.0)
            subject.withdraw(day_two,1500.0)
            expect(subject.balance).to eq 0.0
            expect(subject.transaction_history).to eq ([['14/01/2012',1500.0,1500.0],['18/01/2012',-1500.0,0.0]])
        end 
    end 

    describe 'show_bank_statement' do

        bank_statement_string = "date || credit || debit || balance\n24/01/2012 || || 500.0  || 2000.0\n18/01/2012 || 1000.0 ||  || 2500.0\n14/01/2012 || 1500.0 ||  || 1500.0\n"

        it 'Should print out the bank statement' do
            subject.deposit(day,1500.0)
            subject.deposit(day_two,1000.0)
            subject.withdraw(day_three,500.0)
            expect{ subject.show_bank_statement }.to output(bank_statement_string).to_stdout
        end 

    
    end 

  

end 