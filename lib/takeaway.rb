require_relative 'menu'

class Takeaway

  attr_reader :order

  def initialize
    @menu = Menu.new.options
    @order = []
  end

  def print_menu
    puts menu_header.center(40)
    menu_to_strings.each do |line|
    puts line.center(40)
    end
  end

  def take_order
    loop do
      puts "What would you like to order? Press return when you are finished."
      selection = gets.chomp
      break if selection.empty?
      raise "We don't have that here, try something else." if !menu_options.include?(selection.downcase)
      note_down(selection)
    end
  end

  private

  def menu_header
    "Today's specials"
  end

  def menu_to_strings
    @menu.map do |item, price|
      item_string = to_legible_strings(item).capitalize
      "#{item_string}: £#{price}"
    end
  end

  def menu_options
    @menu.keys.map do |item|
      to_legible_strings(item).downcase
    end
  end

  def to_legible_strings(symbol)
    symbol.to_s.gsub('_', ' ')
  end

  def note_down(selection)
    puts "How many would you like?"
    number = gets
    number.to_i.times { @order << selection }
  end

end
