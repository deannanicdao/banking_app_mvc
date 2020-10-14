require_relative '../models/model'
require_relative '../views/view'

class BankAccountController

    def initialize
        @bank_account_view = BankAccountView.new
        @bank_account_model = BankAccount.new("pass")
    end

    def run
        while @bank_account_model.incorrect_tries < 3
            @bank_account_view.output("Welcome to the banking app\nEnter your password.")
            input = @bank_account_view.get_input

            if @bank_account_model.password == input
                loop do
                    system('clear')
                    option = @bank_account_view.display_menu
                    
                    case option
                    when 1
                        @bank_account_view.output("Your balance is $#{@bank_account_model.balance}")
                    when 2
                        @bank_account_view.output("Deposit amount ($):")
                        deposit = @bank_account_view.get_input.to_i
                        @bank_account_model.balance += deposit
                        @bank_account_view.output("Your balance is $#{@bank_account_model.balance}")
                    when 3
                        @bank_account_view.output("Withdrawal amount ($):")
                        withdrawal = @bank_account_view.get_input.to_i
                            if withdrawal > @bank_account_model.balance
                                @bank_account_view.output("Insufficient funds.")
                            else
                                @bank_account_model.balance -= withdrawal
                                @bank_account_view.output("Your balance is $#{@bank_account_model.balance}")
                            end
                    when 4
                        system('clear')
                        @bank_account_view.output("Thank you for using Evil Corp.")
                        exit
                    else
                        @bank_account_view.output("Invalid selection.")
                    end
                end
            else
                @bank_account_model.incorrect_tries += 1
                @bank_account_view.output("You have used #{@bank_account_model.incorrect_tries}/3 incorrect login attempts.")
            end
        end    
        @bank_account_view.output("You have exceeded the number of login attempts.")
        @bank_account_view.output("Thank you for using Evil Corp.")
        exit
    end

end