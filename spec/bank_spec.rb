# frozen_string_literal: true

require 'bank'

describe Bank do
  # Using this day variables to pass in as a date argument for the deposit and withdraw functions
  day = '14/01/2012'
  day_two = '18/01/2012'
  day_three = '24/01/2012'

  before :each do
    @bank_account = Bank.new
  end

  it 'Is an instance of the bank class' do
    expect(subject).to be_instance_of(Bank)
  end
  describe 'get_balance' do
    it 'It has a balance of 0 when the class is made' do
      expect(@bank_account.balance).to eq 0.00
    end
  end

  describe 'deposit' do
    it 'It will raise an error if you try to deposit 0 or less' do
        expect { @bank_account.deposit(day, 0.00) }.to raise_error "Can't deposit £0 or less"
        expect { @bank_account.deposit(day, -1.00) }.to raise_error "Can't deposit £0 or less"
    end

    it 'Depositing 500 will make the balance change to 500' do
      @bank_account.deposit(day, 500.00)
      expect(@bank_account.balance).to eq 500.00
      expect(@bank_account.transaction_history).to eq([['14/01/2012', 500.00, 500.00]])
    end
  end

  describe 'withdraw' do
    it 'Will raise an error if the withdrawal amount is more than the balance' do
      expect { @bank_account.withdraw(day, 100.00) }.to raise_error 'Not enough funds'
    end

    it 'Withdrawing 1500 from a balance of 1500 will change the balance to 0' do
      @bank_account.deposit(day, 1500.00)
      @bank_account.withdraw(day_two, 1500.00)
      expect(@bank_account.balance).to eq 0.00
      expect(@bank_account.transaction_history).to eq([['14/01/2012', 1500.00, 1500.00],
                                                       ['18/01/2012', -1500.00, 0.00]])
    end
  end

  describe 'show_bank_statement' do
    bank_statement_string = "date || credit || debit || balance\n24/01/2012 || || 500.00  || 2000.00\n18/01/2012 || 1000.00 ||  || 2500.00\n14/01/2012 || 1500.00 ||  || 1500.00\n"

    it 'Should print out the bank statement' do
      @bank_account.deposit(day, 1500)
      @bank_account.deposit(day_two, 1000)
      @bank_account.withdraw(day_three, 500)
      expect { @bank_account.show_bank_statement }.to output(bank_statement_string).to_stdout
    end
  end
end
