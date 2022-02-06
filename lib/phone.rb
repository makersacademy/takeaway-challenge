class Phone
  attr_reader :text
  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @text = text
  end
  
  
  def receive
   "#{@restaurant.text}"
  end

end