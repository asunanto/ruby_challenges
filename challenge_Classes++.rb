class BankAccount
    attr_accessor :balance
    @@balance = 0
    #@@history = []
    def initialize(user, password, balance)
        @user = user
        @password = password
        @@balance = balance
    end

    def withdraw(cash)
        if (cash <= @@balance)
            @@balance -= cash
            #@@history.push(@@balance)
            puts "You have withdrawn $#{cash}, your balance is now $#{@@balance}."
            return @@balance
        else
            puts "Can't withdraw more than balance"
        end
    end

    def deposit(cash)
        @@balance += cash
       # @@history.push(@@balance)
        puts "You have deposited $#{cash}, your balance is now $#{@@balance}."
        return @@balance
    end

    def print_balance
        puts "Your balance is: #{@@balance}"
    end

end

begin
    user_hash = eval(File.read('bank_balance.txt'))
rescue Errno::ENOENT => e
    user_hash = {}
end


def signup(userhash,user,pass)
    key = "#{user} #{pass}"
    if userhash.has_key?(key)  #https://www.shortcutfoo.com/app/dojos/ruby-hashes/cheatsheet
        puts "username and password have already existed."
        return false
    else
        userhash[key] = {}
        userhash[key]['history'] = []
        balance = 0
        puts "new Account created!"
        return true
    end
end

def login(userhash,user,pass)
    key = "#{user} #{pass}"
    if userhash.has_key?(key)
        puts "login Successful!"
        return true
    else
        puts "incorrect user and password"
        return false
    end
end

 
# bank_account.print_balance
# bank_account.deposit(50)
# bank_account.withdraw(20)
# bank_account.history

def is_numeric?(s)
    !!Float(s) rescue false
end

bank_account = BankAccount.new('','',0)
while(1)
    puts "welcome to your banking app? (login/register?)"
    choice = gets.chomp
    
    case choice
        when "r"
            puts "please enter Username"
            user = (gets.chomp).delete(' ')
            puts "please enter Password"
            password = (gets.chomp).delete(' ')
            if signup(user_hash,user,password) #sign up success
                bank_account = BankAccount.new(user,password,0)
                key = "#{user} #{password}"
                history = user_hash[key]["history"] = [0] 
                File.write('bank_balance.txt', user_hash)
                break
            end

        when "l"
            puts "please enter Username"
            user = (gets.chomp).delete(' ')
            puts "please enter Password"
            password = (gets.chomp).delete(' ')
            if login(user_hash,user,password) #login success
                key = "#{user} #{password}"
                history = user_hash[key]["history"]
                balance = history.last
                balance = balance.to_i
                bank_account = BankAccount.new(user,password,balance)
                break;
            end
        else
            puts "please key-in 'l' or 'r'"
    end
end


while(1)
    puts "what would you like to do? (options: balance/deposit/withdraw/history/quit) "
    options = (gets.chomp).downcase
    case options
        when "balance"
            bank_account.print_balance
        when "deposit"
            puts "how much would you like to deposit?"
            deposit = gets.chomp
            if (is_numeric?(deposit))
                deposit = deposit.to_i
            end
            balance = bank_account.deposit(deposit)
            history.push(balance)
            File.write('bank_balance.txt', user_hash)
        when "withdraw"
            puts "how much would you like to withdraw?"
            withdraw = gets.chomp
            if (is_numeric?(withdraw))
                withdraw = withdraw.to_i
            end
            balance = bank_account.withdraw(withdraw)
            history.push(balance)
            File.write('bank_balance.txt', user_hash)
        when "history"
            puts history
        when "quit"
            break;
        else
            puts "invalid input!!!"
    end
end


