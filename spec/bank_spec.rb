require 'bank'

describe Bank do
    it 'Is an instance of the bank class' do
        expect(subject).to be_instance_of (Bank)
    end 

    it 'It has a balance of 0 when the class is made' do
        newBank = Bank.new 
        expect(newBank.get_balance).to eq 0
    end 

end 