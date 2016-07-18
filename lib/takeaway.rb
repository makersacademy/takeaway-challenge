require_relative "menu"



class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    dishes.map do |title,price|
      "$s £.2f" % [title.to_s.capitalize, price]
    end
  end

private

attr_reader :menu

end
