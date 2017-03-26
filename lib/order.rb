require_relative 'menu'

class Order

  attr_reader :items, :payment, :mobile_number

  def initialize
    @items = Hash.new
    @payment
    @mobile_number
  end

  def input
    puts "Please enter item"
    item = gets.chomp
    puts "Please enter quantity"
    quantity = gets.chomp
    items[item] = quantity.to_i
    while true
      puts "Please enter item"
      item = gets.chomp
      break if item == ""
      puts "Please enter quantity"
      quantity = gets.chomp
      items[item] = quantity_to_i
    end
  end

  def total(menu)
    puts "Your order comes to:"
    items.each {|i, q| puts "#{q} #{i}s at £#{menu.list[i]} each"}
    puts "Please enter the payment amount"
    self.payment = gets.chomp.to_i
    puts "Please enter your mobile number"
    self.mobile_number = gets.chomp
  end


  private

  attr_writer :items, :payment, :mobile_number

end
