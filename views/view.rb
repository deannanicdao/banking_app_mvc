class BankAccountView
    
    def initialize
    end

    def get_input
        return gets.chomp.strip
    end

    def display_menu
        puts "What would you like to do?"
        puts "(1) Balance"
        puts "(2) Deposit"
        puts "(3) Withdraw"
        puts "(4) Exit"
        option = gets.chomp.strip.to_i
        return option
    end

    def output(statement)
        system('clear')
        puts statement
        sleep(1)
    end

end
