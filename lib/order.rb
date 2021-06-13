require_relative "list"

class Order

  attr_reader :selection

  def initialize(list = List.new)
    @list = list
  end

  # @menu = {
  #    "Coffee" => 2.50
  #     "Soft Drink" => 1.50,
  #     "Sandwich (Cold)" =>  5.90,
  #     "Sandwich (Hot)" =>  8.90,
  #     "Fresh Juices" => 4.70,
  #     "Pastries" => 1.80
  #   }

  def see_menu
    @list.menu
  end

  def select_dishes(dish)
    @selection = []
    dishes = @list.menu

    dishes.each do |key, value|
      selection << dish if key == dish
    end
    selection.length > 0
  end

  # def total
  #   dishes = ["Soft Drink" => 1.50, "Fresh Juices" => 4.70]
  #   selection = ["Soft Drink", "Fresh Juices"]
  #   total = []

  #   selection.each do |dish|
  #     total << dish 
  #     if dishes.key?(dish)
  #       total << dishes[dish].to_f

  #   end
  #   @selection.select do |dish|
  #     dishes.
  #   end
  # end

end