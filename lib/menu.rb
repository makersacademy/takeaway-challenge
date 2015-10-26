require_relative 'menu_types'

class Menu
  include MenuTypes

  attr_reader :menu, :total_basket

  def initialize(menu_type = MenuTypes::CHINESE)
    @menu = menu_type
  end

  def add(food, quantity=1)
    raise "Food type not found for #{food}" unless @menu.any? {|hsh| hsh[:food] == food }
    @menu.each{ |elem| elem[:quantity_ordered] += quantity if elem[:food] == food }
  end

  def view_basket
    raise "Nothing added to the order!" if empty?
    ordered_items.map {|hash| "#{hash[:food]} x#{hash[:quantity_ordered]}: £#{sprintf("%.2f", hash[:quantity_ordered]*hash[:price])}" if hash[:quantity_ordered] > 0 }.join(", ") + ", Total: £#{sprintf("%.2f", total)}"
  end

  def view_menu
    @menu.each do |elem|
      puts "#{elem[:food]} - £#{sprintf("%.2f", elem[:price])}"
    end
  end

  def total
    @menu.inject(0) {|sum, elem| sum += (elem[:quantity_ordered] * elem[:price])}
  end

  private

  def empty?
    @menu.none? {|hash| hash[:quantity_ordered] > 0 }
  end

  def ordered_items
    @menu.select {|hash| hash[:quantity_ordered] > 0 }
  end

end