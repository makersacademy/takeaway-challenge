class Takeaway

attr_reader :menu , :basket

  def initialize
    @menu = {"Pizza"=> 6, "Curry"=> 4, "Chips"=> 2}
    @basket = []
  end

  def order(dish, quantity)
    raise not_on_menu_msg if !@menu.has_key?(dish)
    # @basket << dish
     @basket << {dish => quantity}
     p "#{quantity} x #{dish} added to your basket!"
  end

  def order_summary
    # p "this is the order"
    result = Hash.new(0)
    @basket.each {|i| i.each { |item, num | result[item] += num } }
    # result
    puts "You have ordered:"
    result.each {|item, num | puts "#{item} x #{num}" }
  end





  private

  def not_on_menu_msg
    "Not on the menu, please try again"
  end

end
