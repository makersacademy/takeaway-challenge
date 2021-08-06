class Restaurant
  attr_reader :dishes

  def initialize
    @name = "New Restaurant"
    @dishes = [
      {dish: "Sushi", price: 7.50}, 
      {dish: "Burger", price: 6.10}, 
      {dish: "Fries", price: 3.00}, 
      {dish: "Noodle Soup", price: 10.00}, 
      {dish: "Bahn Mi", price: 9.25}
    ]
  end

  def select_dishes(*args)
    # error if no arguments given

    selection = []
    @dishes.each_with_index do |dish, i|
      menu_num = i + 1
      selection << dish if args.include? menu_num
    end
    selection
  end
end
