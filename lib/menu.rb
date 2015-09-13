require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    wrong_name?(dish)
    wrong_price?(dish)
    @dishes << dish
  end

  def display
    to_display = "                  MENU  \n\n"
    to_display = dishes.inject(to_display) do |object, dish|
      object = object + dish.display_info + "\n"
    end
    to_display
  end

  private

  def wrong_name?(dish)
    fail 'invalid dish' unless dish.respond_to?(:name)
    fail 'invalid name' unless dish.name.is_a?(String) && dish.name.length < 31
  end

  def wrong_price?(dish)
    fail 'invalid dish' unless dish.respond_to?(:price)
    fail 'invalid price' unless dish.price.is_a?(Float) && dish.price >= 0
  end

end
