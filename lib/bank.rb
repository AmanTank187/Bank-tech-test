# frozen_string_literal: true

class Bank
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(date, amount)
    raise "Can't deposit £0 or less" if amount <= 0
    @balance += amount
    saving_bank_action_data(date, amount)
  end

  def withdraw(date, amount)
    raise 'Not enough funds' if amount > @balance

    @balance -= amount
    saving_bank_action_data(date, -1 * amount)
  end

  def show_bank_statement
    puts 'date || credit || debit || balance'
    printing_transaction_data
  end

  private

  def saving_bank_action_data(date, amount)
    @transaction_history << ([date, amount, balance])
  end

  def printing_transaction_data
    @transaction_history.reverse.each do |i|
        if i[1].negative?
          puts "#{i[0]} || || #{('%.2f' % (-1 * i[1]))}  || #{('%.2f' % (i[2]))}"
        else
          puts "#{i[0]} || #{('%.2f' % (i[1]))} ||  || #{('%.2f' % (i[2]))}"
        end
      end
  end 

end
