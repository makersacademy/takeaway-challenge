
class Menu


  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end
  # def dish_list
  # dishes_and_prices = {
  #   "seaweed" => 6.20,
  #   "Kung po chicken" => 5.40,
  #   "beef chow mein" => 4.40,
  #   "egg fried rice" => 2.20,
  #   "chicken balls" => 3.50}
  # end


  def print_menu
    dishes.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end
end
