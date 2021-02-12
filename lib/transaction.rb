class Transaction

    attr_accessor :amount, :current_balance, :date
  
    def initialize(amount,balance)
      @amount = amount 
      @date = Time.now 
      @current_balance = balance
    end 

    def to_s
      return "#{@date} , #{@amount} , #{@current_balance}"
    end 
  
  end