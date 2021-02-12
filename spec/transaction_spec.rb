require 'transaction' 

describe Transaction do
    
    describe 'to_s' do
        it "Returns the attributes as a string" do
            deposit = Transaction.new(500,500)
            expect(deposit.to_s).to eq  "#{deposit.date} , #{deposit.amount} , #{deposit.current_balance}"
        end 
    end 
end 

