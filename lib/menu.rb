require_relative 'dishes'

class Menu

  def initialize(dishes = Dishes.new)
    @dishes = dishes
  end

  def list(type)
    puts "Here is the #{type.capitalize} menu:"
    if type == "indian"
      return @dishes.indian.each do |name, price|
        puts "#{name}: £#{price}"
      end
    elsif type == "italian"
      return @dishes.italian.each do |name, price|
        puts "#{name}: £#{price}"
      end
    elsif type == "chinese"
      return @dishes.chinese.each do |name, price|
        puts "#{name}: £#{price}"
      end
    elsif type == "drinks"
      return @dishes.drinks.each do |name, price|
        puts "#{name}: £#{price}"
      end
    end
  end

end
