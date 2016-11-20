class Order

  attr_reader :meal, :payment

  def initialize(menu, meal)
    @menu = menu
    @meal = meal[0]
    @payment = meal[1]
  end

  # def calculate_total
  #   total = 0
  #   meal.each do |pizza, quantity|
  #     total += @menu[pizza] * quantity
  #   end
  #   total
  # end



end
