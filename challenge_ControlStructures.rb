


#begin
   # balance = File.read('challenge_ControlStructuresData.txt');
 #   balance = balance.to_i;

#rescue Errno::ENOENT => e
 #   balance = 0;
#end
balance = 0;
counterClearScreen = 10;
history = [];
f = "";
userTransHistHash = {}; #user transaction history hash map
begin
    f = File.read('challenge_ControlStructuresHash.txt');
    userTransHistHash = eval(f);
rescue Errno::ENOENT => e

end


#balance+ = balance.to_i;

puts "Enter your Password";
password = gets.chomp;

if (password == 'password')
puts "Enter your Username";
userName = gets.chomp;


begin
    balance = userTransHistHash[userName].last;
    balance = balance.to_i;
    history = userTransHistHash[userName];
rescue NoMethodError => e
    (userTransHistHash[userName] ||= []) << 0;
end

puts userTransHistHash
puts "Welcome to the banking app";
puts "your balance is $#{balance}";

while(1)

    #puts "Enter your Username";
    #userName = gets.chomp;
    puts "What would you like to do? (options: balance/deposit/withdraw/history)";
    counterClearScreen = counterClearScreen -1;
    options = gets.chomp;
    puts userTransHistHash
    if (options =="balance")
        puts "Your balance is #{balance}";

    elsif (options == "deposit")
        puts "How much would you like to deposit?";
        deposit = gets.chomp;
        deposit = deposit.to_i;
        balance += deposit;
        puts "your balance is $#{balance}";
        #(history ||= []).push(balance);
        #puts balance
        #File.write('challenge_ControlStructuresData.txt', balance);
        (userTransHistHash[userName] ||= []) << balance;
        File.write('challenge_ControlStructuresHash.txt', userTransHistHash);
        history = userTransHistHash[userName];
        puts userTransHistHash;

    elsif (options == "withdraw")
        puts "How much would you like to withdraw?";
        withdraw = gets.chomp;
        withdraw = withdraw.to_i;
        if (withdraw <= balance)
            balance -= withdraw;
            puts "$#{withdraw} withdrawn, your balance is $#{balance}";
            #(history ||= []).push(balance);
            #File.write('challenge_ControlStructuresData.txt', balance);
            (userTransHistHash[userName] ||= []) << balance;
            history = userTransHistHash[userName];
            File.write('challenge_ControlStructuresHash.txt', userTransHistHash);
            puts userTransHistHash;

        else
            puts "you can't withdraw more than your balance!";
        end

    elsif (options == 'history')
        puts history

    else
        puts "invalid selection!";
    end

    if (counterClearScreen == 0)
        system "clear";
    end

end

else
    puts "incorrect password!"
end


