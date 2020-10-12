class Menu 
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    @dishes.map do |item, price|
      "#{item.to_s.capitalize} £#{price}"
    end.join(', ')
  end

  def available?(item)
    @dishes.has_key?(item.to_sym)

  end
end
