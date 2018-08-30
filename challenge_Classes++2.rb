require 'json'
class BankAccount
    attr_accessor :balance
    @balance = 0
    #@@history = []
    def initialize(user, password, balance)
        @user = user
        @password = password
        @balance = balance
    end

    def withdraw(cash)
        if (cash <= @balance)
            @balance -= cash
            #@@history.push(@@balance)
            puts "You have withdrawn $#{cash}, your balance is now $#{@balance}."
            return @balance
        else
            puts "Can't withdraw more than balance"
        end
    end

    def deposit(cash)
        @balance += cash
       # @@history.push(@@balance)
        puts "You have deposited $#{cash}, your balance is now $#{@balance}."
        return @balance
    end

    def print_balance
        puts "Your balance is: #{@balance}"
    end

end

begin
    user_hash = JSON.parse(File.read('balance.json'),:symbolize_names => true)
rescue Errno::ENOENT => e
    user_hash = {}
end

class User
    def initialize(userhash, user, pass)
        @userhash = userhash
        @user = user
        @pass = pass
    end

    def signup
        if  @userhash.has_key?(:"#{@user} #{@pass}")  #https://www.shortcutfoo.com/app/dojos/ruby-hashes/cheatsheet
            puts "username and password have already existed."
            return false
        else
            @userhash[:"#{@user} #{@pass}"] = {}
            @userhash[:"#{@user} #{@pass}"][:history] = []
            balance = 0
            puts "new Account created!"
            return @user_hash
        end
    end
    
    def login
        if @userhash.has_key?(:"#{@user} #{@pass}")
            puts "login Successful!"
            return @user_hash
        else
            puts "incorrect user and password"
            return false
        end
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
            new_user = User.new(user_hash,user,password)
            if  (new_user.signup != false) #sign up success
                bank_account = BankAccount.new(user,password,0)
                history = user_hash[:"#{user} #{password}"][:history] = [0] 
                File.write('balance.json', JSON.dump(user_hash))
                break
            end

        when "l"
            puts "please enter Username"
            user = (gets.chomp).delete(' ')
            puts "please enter Password"
            password = (gets.chomp).delete(' ')
            exist_user = User.new(user_hash,user,password)
            if  (exist_user.login != false) #login success
                history = user_hash[:"#{user} #{password}"][:history]
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
            File.write('balance.json', JSON.dump(user_hash))
        when "withdraw"
            puts "how much would you like to withdraw?"
            withdraw = gets.chomp
            if (is_numeric?(withdraw))
                withdraw = withdraw.to_i
            end
            balance = bank_account.withdraw(withdraw)
            history.push(balance)
            File.write('balance.json', JSON.dump(user_hash))
        when "history"
            puts history
        when "quit"
            break;
        else
            puts "invalid input!!!"
    end
end



    