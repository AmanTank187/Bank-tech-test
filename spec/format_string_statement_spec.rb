require 'format_string_statement' 

describe FormatStringStatement do
    
    describe '#get_header' do
        it 'It should return the header for the table' do 
            expect(subject.get_header).to eq 'date || credit || debit || balance'
        end 
    end 

    describe '#format_statement' do
        new_transaction = Transaction.new(700,500)
        it 'Return the statement formatted in the correct way' do 
            expect(subject.format_statement(new_transaction)).to eq "12/02/2021 || 700.00 ||  || 500.00"
        end 
    end 
end 
                
