require_relative 'transaction'
require_relative 'format_string_statement'

class Bank
  attr_reader :balance

  def initialize(format)
    @balance = 0
    @transaction_history = []
    @formatter = format
  end

  def deposit(amount)
    raise "Can't deposit £0 or less" if amount <= 0

    update_balance(amount)
    saving_transaction_history(amount,balance)
  end

  def withdraw(amount)
    raise 'Not enough funds' if amount > @balance

    update_balance(-1 * amount)
    saving_transaction_history(-1 * amount,balance)
  end

  def show_bank_statement
    puts @formatter.get_header
    printing_transaction_data
  end

  private

  attr_accessor  :transaction_history


  def update_balance(amount)
    @balance += amount
  end

  def saving_transaction_history(amount,balance)
    @transaction_history << Transaction.new(amount,balance)
  end

  def printing_transaction_data
    @transaction_history.reverse.each do |transaction|
      puts @formatter.format_statement(transaction)
    end 
  end
end


