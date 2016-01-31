
require_relative 'italian_menu'
# require_relative 'order'
# require_relative 'basket'

class Menu

SCREEN_WIDTH = 40

attr_reader :selection, :cuisine_choice, :meal, :course, :order, :basket
# :menu_choice
# :order

  def initialize(cuisine_choice=ItalianMenu, order=Order, basket=Basket)
    @cuisine_choice = cuisine_choice
    @basket = basket
    @order = order
  end

  def menu_choice(meal= :dinner, course= :all)
    @meal = meal
    @course = course
    fail "We only serve lunch and dinner" until meal_choice_valid?
    fail "Please choose starter, main, dessert or 'all'" until course_choice_valid?
    @menu_choice = cuisine_choice.new(meal, course).dishes
  end


  def display
    menu_choice.each{|key, value| puts("#{key}".ljust(SCREEN_WIDTH) + "#{value}".rjust(SCREEN_WIDTH))}
  end


  def take_order
    p "What would you like to eat?"
    user_input = STDIN.gets.chomp
    @order = order.new(user_input, menu_choice)
  end

  def select_dish(dish, quantity)
    @basket = basket.new(dish, quantity)
  end



  private

  def meal_choice_valid?
    meal == :dinner || meal == :lunch
  end

  def course_choice_valid?
    [:starter, :main, :dessert, :all].include? course
  end

end

  #
  # def confirm_order
  #   will initialize a order.new with the information from def.select
  #
  # end
  #
  # def bill
  # => will retrieve info from order
  # end
