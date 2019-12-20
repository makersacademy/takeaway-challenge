require './lib/menu.rb'

class Order
  attr_reader :choice
  def initialize(menu = Menu)
    @menu = menu.new
    @choice = []
  end

  def see_menu
    @menu.list
  end

  def choose_item(name)
    @choice << {name => @menu.get_price(name)}
  end

  def total_price
    t = 0
    @choice.each do |i|
      i.each_value { |v| t += v }
    end
    t
  end

  def print_receipt
    @choice.each do |i|
      i.each {|k, v| puts "#{k} - £%0.2f" % v }
    end
    puts "Total to pay: £%0.2f" % self.total_price
  end
end
