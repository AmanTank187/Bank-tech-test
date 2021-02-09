class Bank
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    raise "Can't deposit £0 or less" if amount <= 0

    update_balance(amount)
    saving_bank_action_data(amount)
  end

  def withdraw(amount)
    raise 'Not enough funds' if amount > @balance

    update_balance(-1 * amount)
    saving_bank_action_data(-1 * amount)
  end

  def show_bank_statement
    puts 'date || credit || debit || balance'
    printing_transaction_data
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def current_date
    Time.now
  end

  def saving_bank_action_data(amount)
    @transaction_history << { date: current_date, amount: amount, current_balance: balance}
  end

  def printing_transaction_data
    @transaction_history.reverse.each do |i|
      if i[:amount].negative?
        puts "#{i[:date].strftime('%d/%m/%Y')} || || #{format('%.2f', (-1 * i[:amount]))}  || #{format('%.2f', (i[:current_balance]))}"
      else
        puts "#{i[:date].strftime('%d/%m/%Y')} || #{format('%.2f', (i[:amount]))} ||  || #{format('%.2f', (i[:current_balance]))}"
      end
    end
  end
  
end
