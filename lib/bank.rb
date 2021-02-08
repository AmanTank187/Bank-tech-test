
class Bank 

    attr_reader :balance, :bank_statement_array

    def initialize 
        @balance = 0
        @bank_statement_array = []
    end 

    def deposit(date,amount)  
        @balance += amount 
        saving_bank_action_data(date,amount)
    end 

    def withdraw(date,amount)  
        @balance -= amount
        saving_bank_action_data(date,-1 * amount)
    end 

    def show_bank_statement
        puts "date || credit || debit || balance"
        @bank_statement_array.reverse.each do |i|
            if i[1].negative?
                puts "#{i[0]} || || #{-1 * i[1]}  || #{i[2]}"
            else 
                puts "#{i[0]} || #{i[1]} ||  || #{i[2]}"
            end 
        end 
    end 

private 

    def saving_bank_action_data(date,amount)
        @bank_statement_array << ([date,amount,self.balance])
    end 

end 