require 'bank'

describe Bank do
    it 'Is an instance of the bank class' do
        expect(subject).to be_instance_of (Bank)
    end 
    describe 'get_balance' do
        it 'It has a balance of 0 when the class is made' do
            newBank = Bank.new 
            expect(newBank.get_balance).to eq 0
        end 
    end 

    describe 'deposit' do
        it 'Depositing 500 will make the balance change to 500' do
            subject.deposit(500)
            expect(subject.get_balance).to eq 500
        end 
    end 

    

end 