class Bank
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    raise "Can't deposit £0 or less" if amount <= 0

    update_balance(amount)
    saving_transaction_history(amount)
  end

  def withdraw(amount)
    raise 'Not enough funds' if amount > @balance

    update_balance(-1 * amount)
    saving_transaction_history(-1 * amount)
  end

  def show_bank_statement
    puts 'date || credit || debit || balance'
    printing_transaction_data
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def saving_transaction_history(amount)
    @transaction_history << { date: Time.now , amount: amount, current_balance: balance}
  end

  def printing_transaction_data
    @transaction_history.reverse.each do |i|
        #This IF statement formats each data in the correct way to show to the user. Data will be shown in the correct format and numbers will be shown with .00 at the end. 
      if i[:amount].negative?
        puts "#{i[:date].strftime('%d/%m/%Y')} || || #{format('%.2f', (-1 * i[:amount]))}  || #{format('%.2f', (i[:current_balance]))}"
      else
        puts "#{i[:date].strftime('%d/%m/%Y')} || #{format('%.2f', (i[:amount]))} ||  || #{format('%.2f', (i[:current_balance]))}"
      end
    end
  end
  
end
