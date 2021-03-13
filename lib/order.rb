class Order
  attr_reader :whole_order
  def initialize
    @whole_order = []
    @dishes = Dishes.new
  end

  def select_dishes
    order = gets.chomp
    list_of_dishes = @dishes.dishes
    list_of_dishes.each do |key, value|
      if order == key
        @whole_order << "#{key} ---> #{value}"
      end
    end
  end

  def return_order
    @whole_order.each do |key, value|
      "Hi"
    end
  #Taking a break - select_dishes now pushes the key
  #value pairs into the array. Now need to find a way of
  # returning the prices only.
  end
end
