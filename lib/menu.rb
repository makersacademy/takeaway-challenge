class Menu 
  def initialize
    @list = {dish1: 10, dish2: 11}
    @selected_dishes = []
  end

  def show_dishes
    @list.each { |key,value| puts "#{key}: #{value}" }
  end

  def select_dishes(*args)
    args.each do |order_item|
      # conver order_item -> which will be a string -> to a symbol -> to test for if dish is on menu
      # raise 'Dish not available' unless available_dish(order_item)
      @selected_dishes << order_item if available_dish(order_item)
    end
  end

  def show_selected_dishes
    @selected_dishes
  end

  private 

  def available_dish(dish)
    @list.keys.include?(dish.to_sym)
  end

end