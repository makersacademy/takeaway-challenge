class Checkout

  def place_order(items)
    @items = items
    puts "You have a total of #{@items.length} items!"
    index = 1
    @items.each do |hash|
      puts "#{index}: #{hash[:name]} - £#{sprintf("%.2f", hash[:price])}"
      index += 1
    end
  end

  def verify_order(price)
    puts "Your total order is for £#{sprintf("%.2f", price)}"
    puts "Is this correct? [y/n]"
    input = gets.chomp
    fail "User was not satisfied with his order" if input == "n"
    puts "Thank you! Your order was placed and will be delivered before 18:52"
    exit
  end
end
