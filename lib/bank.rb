class Bank 

    def initialize 
        @balance = 0
    end 

    def get_balance
        @balance
    end 

    def deposit(date,amount)  
        @balance += amount 
    end 
end 