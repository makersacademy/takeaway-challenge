require_relative 'menu'
class TakeAway

  attr_reader :selection

  def initialize(menu)
    @menu = menu
    @selection = []
  end

  def print_menu
    @menu.pretty_print
  end

  def select_food(dishe, quantity = 1)
    raise "Sorry we don't have #{dishe}!" if @menu.list[dishe.to_sym].nil?
    @selection << { dishe.to_sym => quantity }
  end

  def total
    @selection.map { |hash| hash.map { |key, value| value * @menu.list[key] }.reduce(:+) }.first
  end

  

end
