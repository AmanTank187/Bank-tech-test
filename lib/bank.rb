# frozen_string_literal: true

class Bank
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(date, amount)
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
    @transaction_history.reverse.each do |i|
      if i[1].negative?
        puts "#{i[0]} || || #{-1 * i[1]}  || #{i[2]}"
      else
        puts "#{i[0]} || #{i[1]} ||  || #{i[2]}"
      end
    end
  end

  private

  def saving_bank_action_data(date, amount)
    @transaction_history << ([date, amount, balance])
  end
end
