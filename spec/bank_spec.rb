require 'bank'

describe Bank do
  # This variable formats a data object into a shorter format.
  # I can then use this within my tests to check if the date is being printed out correctly.
  today = Time.now.strftime('%d/%m/%Y')

  before :each do
    @my_account = Bank.new
  end

  describe 'get_balance' do
    it 'It has a balance of 0 when the class is made' do
      expect(@my_account.balance).to eq 0.00
    end
  end

  describe 'deposit' do
    it 'It will raise an error if you try to deposit 0 or less' do
      expect { @my_account.deposit(0.00) }.to raise_error "Can't deposit £0 or less"
      expect { @my_account.deposit(-1.00) }.to raise_error "Can't deposit £0 or less"
    end

    it 'Depositing 500 will make the balance change to 500' do
      @my_account.deposit(500.00)
      expect(@my_account.balance).to eq 500.00
    end
  end

  describe 'withdraw' do
    it 'Will raise an error if the withdrawal amount is more than the balance' do
      expect { @my_account.withdraw(100.00) }.to raise_error 'Not enough funds'
    end

    it 'Withdrawing 1500 from a balance of 1500 will change the balance to 0' do
      @my_account.deposit(1500.00)
      @my_account.withdraw(1500.00)
      expect(@my_account.balance).to eq 0.00
    end
  end

  describe 'show_bank_statement' do
    # Saving the expected print statement as a variable so it can be tested in multiple places.
    bank_statement_string = "date || credit || debit || balance\n25/02/2021 || || 500.00  || 2000.00\n15/02/2021 || 1000.00 ||  || 2500.00\n13/02/2021 || 1500.00 ||  || 1500.00\n"

    it 'Should print out the bank statement after user has done transactions' do
      allow(Time).to receive(:now).and_return Time.new(2021,2,13)
      @my_account.deposit(1500)
      allow(Time).to receive(:now).and_return Time.new(2021,2,15)
      @my_account.deposit(1000)
      allow(Time).to receive(:now).and_return Time.new(2021,2,25)
      @my_account.withdraw(500)
      # Using .output and .to_stdout to check if the table is being printed out to the console.
      expect { @my_account.show_bank_statement }.to output(bank_statement_string).to_stdout
    end
  end
end
