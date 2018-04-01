require_relative 'menu'
class Order
  attr_reader :order_items

  def initialize
    @order_items = {}
  end


  def save_items(menu)
    loop do
      puts "What would you like to order? Press return to finish"
      selection = gets.chomp
      break if selection.empty?
      selection = selection.gsub(/\s+/,'_')
      raise "We don't currently serve this dish!" if menu.options[selection.downcase.to_sym].nil?
      puts "How many would you like?"
      quantity = gets.chomp
      @order_items[selection.to_sym] = quantity.to_i
    end
    'order noted'
  end



end
