require 'terminal-table'

class Menu

  attr_reader :dishes

  def initialize options
    @dishes = options[:dishes]
  end

  def view_dishes
    dishes.each do |item, price|
      puts "#{item} price: £#{price}"
    end
  end
end





