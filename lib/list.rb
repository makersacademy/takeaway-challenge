class List

  def initialize
    @list = { dish1: 10, dish2: 11 }
  end

  def show_dishes
    @list.each { |key, value| puts "#{key}: #{value}" }
  end

  def select_dishes(*args)
    selected_dishes = []
    args.each do |order_item|
      # convert order_item -> which will be a string -> to a symbol -> to test for if dish is on menu
      selected_dishes << {dish: order_item, price: @list[order_item.to_sym]} if available_dish(order_item)
    end
    selected_dishes
  end

  def total(selected_dishes)
    selected_dishes.reduce(0) {|total,dish| total + dish[:price]}
  end

  private

  def available_dish(dish) # List class used here
    @list.key?(dish.to_sym)
  end
end