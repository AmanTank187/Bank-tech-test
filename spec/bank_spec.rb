require 'bank'

describe Bank do
    #Using this day variable to pass in as a date argument for the deposit and withdraw functions 
    day = '14/01/2012' 
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
            subject.deposit(day,500)
            expect(subject.balance).to eq 500
        end 
    end 

    describe 'withdraw' do
        it 'Withdrawing 500 from a total of 1500 will change the balance to 1000' do
            subject.deposit(day,1500)
            subject.withdraw(day,500)
            expect(subject.balance).to eq 1000
        end 
    end 

end 