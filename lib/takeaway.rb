class Takeaway
  attr_reader :orders_list

  def initialize(menu_instance)
    @menu_instance = menu_instance
    @orders_list = []
  end

  def print_menu
    output = ""
    (0..@menu_instance.dishes.length-1).each do |index|
      dish = @menu_instance.dishes[index]
      output += "#{index+1}. #{dish[:name]}: #{dish[:price]}" + "\n"
    end
    return output
  end

  def order(number)
    raise "The number you chose it's not associated to any dish" unless number > 0 && number <= @menu_instance.dishes.length
    @orders_list << number
  end
end
