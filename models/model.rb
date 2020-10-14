class BankAccount
    attr_reader :password
    attr_accessor :incorrect_tries, :balance

    def initialize(password)
        @balance = 0 
        @password = password
        @incorrect_tries = 0
    end
end