class TakeAway

  attr_reader :menu, :basket
	
	def initialize(menu,message=Message.new)
		@menu = menu
		@message = message
		@basket = {}
	end

	def print_menu
		menu.print_dish
	end

	def place_order(item, quantity=1)
    fail "item not on the menu" unless menu.present? item
    basket[item] = quantity
  end

  def basket_summary
    fail 'Basket is empty' if basket.empty?
    basket.map do |item, qty|
    	"#{item} x#{qty}: £#{price(item, qty)}"	
    end.join("\n") + "\nTotal price: £" + total.to_s
  end

  def price(item, qty)
    price = qty * menu.dishes[item].to_f
    format('%.2f', price)
  end

  def reset_order
    @basket = Hash.new(0)
  end

  def checkout(total_price = 0)
  	fail 'Basket is empty' if basket.empty?
    fail 'Wrong total' if total_price != total
    @message.complete_order("Thank you for your order: £#{total_price}")
  end

  private
  def total
  	basket.map { |item, qty| price(item, qty).to_f }.inject(:+)
	end

end