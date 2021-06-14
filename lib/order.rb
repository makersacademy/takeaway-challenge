require_relative "list"

class Order

  attr_reader :selection, :list, :total

  def initialize(list = List.new)
    @list = list
    @selection = []
    @total = []
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

    dishes = @list.menu

    dishes.each do |key, value|
      @selection << dish if key == dish
    end
    @selection if @selection.length > 0


  end

  def total

    @selection.each do |item|
      @total << (@list.menu).fetch(item)
    end
    "Your order total is #{@total.sum}"
  end

end