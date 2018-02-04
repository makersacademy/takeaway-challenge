class Menu

  attr_reader :options

  def initialize
    @options =   {
        :prawn_crackers => 1.95,
        :prawn_summer_roll => 4.95,
        :vegetable_spring_rolls => 3.95,
        :tom_yam_soup => 4.95,
        :green_curry => 6.95,
        :pad_thai => 6.95,
        :steamed_rice => 2.25
        }
  end

  def print_centered
    puts menu_header.center(40)
    menu_to_strings.each do |line|
    puts line.center(40)
    end
  end

  private

  def menu_header
    "Today's specials"
  end

  def menu_to_strings
    @options.map do |item, price|
      item_string = to_legible_strings(item)
      "#{item_string}: £#{price}"
    end
  end

  def to_legible_strings(symbol)
    symbol.to_s.gsub('_', ' ').capitalize
  end

end
