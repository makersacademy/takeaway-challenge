require_relative 'menu'

class Basket
  SUB_TOTAL_TITLE = 'Here is your sub-total so far:'
  SUB_TOTAL_END = 'Sub-total: £'
  private_constant :SUB_TOTAL_TITLE, :SUB_TOTAL_END
  attr_reader :contents

  def initialize(menu = Menu)
    @menu = menu.new
    @contents = []
  end

  def add(dish)
    locate(dish) ? plus_one_quantity(dish) : contents << @menu.choose(dish)
  end

  def sub_total
    puts SUB_TOTAL_TITLE
    @contents.each.map { |dish| puts formatted_display(dish) }.join("\n")
    puts SUB_TOTAL_END + calculate_sub_total.to_s
  end

  private

  def locate(dish)
    contents.find { |hash| hash[:number] == dish }
  end

  def plus_one_quantity(dish)
    locate(dish)[:quantity] += 1
  end

  def formatted_display(dish)
    "#{dish[:name]} - £#{dish[:price]} x #{dish[:quantity]}"
  end

  def calculate_sub_total
    @contents.each.map { |dish| dish[:price] * dish[:quantity] }.sum
  end
end
