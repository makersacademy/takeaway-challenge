module TwoDecimals
  def two_decimals(num)
    '%.2f' % num
  end
end

class Menu

  attr_reader :dishes

  include TwoDecimals

  def initialize
    @dishes = [{ dish: :chicken, value: 7.50 },
      { dish: :beef, value: 9.00 },
      { dish: :pasta, value: 8.50 },
      { dish: :pizza, value: 12.00 },
      { dish: :burger, value: 7.00 }]
  end

  def show_menu
    @dishes.each { |dish| puts "#{dish[:dish].to_s.capitalize} £#{two_decimals(dish[:value])}" }
  end

  def return_dish(dish)
    fail "#{dish} not on menu" unless on_menu?(dish)

    dishes[find_dish(dish)]
  end

  private

  def on_menu?(dish)
    dishes.any? { |meal| meal[:dish] == dish }
  end

  def find_dish(dish)
    dishes.each_with_index { |meal, i| return i if meal[:dish] == dish }
  end

end
