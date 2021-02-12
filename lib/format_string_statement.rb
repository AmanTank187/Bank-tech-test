class FormatStringStatement

    def get_header
        return 'date || credit || debit || balance'
    end 



    def format_statement(transaction)
        # This IF statement formats each data in the correct way to show to the user. Data will be shown in the correct format and numbers will be shown with .00 at the end.
        if transaction.amount.negative?
           return "#{(transaction.date).strftime('%d/%m/%Y')} || || #{format('%.2f',
                                                                (-1 * transaction.amount))}  || #{format('%.2f',
                                                                                                (transaction.current_balance))}"
        else
           return  "#{(transaction.date).strftime('%d/%m/%Y')} || #{format('%.2f',
                                                            (transaction.amount))} ||  || #{format('%.2f',
                                                                                            (transaction.current_balance))}"
        end

    end 

end 