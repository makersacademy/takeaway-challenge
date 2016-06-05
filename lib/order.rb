class Order

	def initialize(menu)
		@basket = []
		@menu = menu
	end

  def add(dish)
  	raise "That dish isn't on the menu, please try again." if !@menu.data.include?(dish)
  	@basket << dish
  	quantity = @basket.count(dish)
  	"#{quantity}x #{dish}, £#{ sprintf('%.2f', (@menu.data[dish] * quantity))} - added to your basket"
  end

  def basket
  	check_basket
  	p @basket.sort
  end

  def view_basket
  	check_basket
  	# iterate over basket and print result - Nx item £price \n  
  	# "#{@basket.each {|x| x.count }}"
  end

  def total
  	check_basket
  	item_count = @basket.each_with_object(Hash.new(0)) { |item, hash| hash[item] += 1 }
  	subtotal = item_count.map { |key, value| item_count[key] * @menu.data[key] }
  	"£#{sprintf('%.2f', subtotal.inject(0){|sum,x| sum + x })}"
  end

  def checkout
  end

  private

  def check_basket
  	raise "Nothing in basket" if @basket.empty?
  end

end