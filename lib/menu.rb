class Menu


attr_reader :food

@food = {
  yum1: 1,
  yum2: 2
}

  def initialize(food = @food)
    @food = food
  end

  def

  def print_food
    food.map do |item, price|
      "#{item} : £#{price}"
    end
  end
end

# class Menu
#
#
# def
#
#   def print
#     PRINTED_MENU
#   end
# end
