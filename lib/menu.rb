require_relative 'menu_types'

class Menu
  include MenuTypes

  attr_reader :menu, :total_basket

  def initialize(menu_type = MenuTypes::CHINESE)
    @menu = menu_type.clone
  end

  def add(food, quantity=1)
    raise "Food type not found for #{food}" unless @menu.any? {|hsh| hsh[:food] == food }
    @menu.each{ |elem| elem[:quantity_ordered] += quantity if elem[:food] == food }
  end

  def total
    @menu.inject(0) {|sum, elem| sum += (elem[:quantity_ordered] * elem[:price])}
  end

  def view_menu
    @menu.each do |elem|
      puts "#{elem[:food]} - £#{sprintf("%.2f", elem[:price])}"
    end
  end
end