class Takeaway

  attr_reader :order

  def initialize
    @menu = {
      :prawn_cracker => 1.95,
      :prawn_summer_roll => 4.95,
      :vegetable_spring_rolls => 3.95,
      :tom_yam_soup => 4.95,
      :green_curry => 6.95,
      :pad_thai => 7.00,
      :steamed_rice => 2.25
      }
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
      @order << selection
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

end
