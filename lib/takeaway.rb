class Takeaway
  attr_accessor :food
  attr_reader :current_order

  def initialize
    @food = { margareta: 4, hawaiian: 5}
    @current_order = {}
  end

  def menu
    puts 'welcome to sloppy joes command line pizzaria:'
    food.each { |food, price| puts "#{food} : £#{price}" }
  end

  def select_dish(dish, quantity)
    fail 'Sorry this is an invalid dish' unless valid_dish?(dish)
    current_order[dish] = quantity
  end

  private

  def valid_dish?(dish)
    food.include?(dish)
  end

end
