class Checkout

  def verify_order(items)
    @items = items
    puts "You have a total of #{@items.length} items!"
    index = 1
    @items.each do |hash|
      puts "#{index}: #{hash[:name]} - £#{sprintf("%.2f", hash[:price])}"
      index += 1
    end
  end

  def place_order(price)
    puts "Your total order is for £#{sprintf("%.2f", price)}"
    puts "Is this correct? [y/n]"
    input = gets.chomp
    fail "Bill did not match up" if input == "n"
    puts "Thank you! Your order was placed and will be delivered before 18:52"
  end
end
