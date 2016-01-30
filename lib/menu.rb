
require_relative 'italian_menu'

class Menu

SCREEN_WIDTH = 40

attr_reader :selection, :cuisine_choice, :meal, :course, :menu_choice
# :menu_choice
# :order

  def initialize(cuisine_choice=ItalianMenu)
    @cuisine_choice = cuisine_choice
    @selection = []
    # @order = order
    #will inject order_klass later?
  end

  def menu_choice(meal= :dinner, course= :all)
    @meal = meal
    @course = course
    fail "We only serve lunch and dinner" until meal_choice_valid?
    fail "Please choose starter, main, dessert or 'all'" until course_choice_valid?
    @menu_choice = cuisine_choice.new(meal, course)
  end


  def display
    menu_choice.dishes.each{|key, value| puts("#{key}".ljust(SCREEN_WIDTH) + "#{value}".rjust(SCREEN_WIDTH))}
  end



  def select(dish, quantity)
    @menu_choice.dishes.select
  end

  private

    def meal_choice_valid?
      meal == :dinner || meal == :lunch
    end

    def course_choice_valid?
      course == :starter || course == :main || course == :dessert || course == :all
    end

end
  #
  # def select(dish, quantity)
  # Will let the
  # end
  #
  # def confirm_order
  #   will initialize a order.new with the information from def.select
  #
  # end
  #
  # def bill
  # => will retrieve info from order
  # end
