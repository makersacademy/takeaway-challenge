require 'line_length'

class Menu
  include LineLength
  attr_reader :dishes, :name

  def initialize(name="MENU")
    @name = name
    @dishes = []
  end

  def add_dish(dish)
    wrong_name?(dish)
    wrong_price?(dish)
    dishes << dish
  end

  def offer?(dish)
    @dishes.include?(dish)
  end

  def display
    to_display = dishes.inject(display_menu_title) do |object, dish|
      object = object + dish.display_info + "\n"
    end
    to_display
  end

  private

  def display_menu_title
    side_spacing = (line_length - name.length) / 2
    to_display = " "*side_spacing + name + " "*side_spacing + "\n\n"
  end

  def wrong_name?(dish)
    fail 'invalid dish' unless dish.respond_to?(:name)
    fail 'invalid name' unless dish.name.is_a?(String) && dish.name.length < 31
  end

  def wrong_price?(dish)
    fail 'invalid dish' unless dish.respond_to?(:price)
    fail 'invalid price' unless dish.price.is_a?(Float) && dish.price >= 0
  end

end
