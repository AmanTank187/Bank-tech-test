class Bank 

    attr_reader :balance

    def initialize 
        @balance = 0
    end 

    def deposit(date,amount)  
        @balance += amount 
        
    end 

    def withdraw(date,amount)  
        @balance -= amount 
    end 

end 