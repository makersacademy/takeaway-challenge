require 'pry'

class SMSProcess

  def break_up_input(input)
    input_array = input.split(", ")
    @customer_input_price = input_array.pop.to_i
    input_array
  end

  def format_dish_input(list)
    dish_array = []
    for i in 0...(list.count) do
      if (i % 2).zero?
        temporary_array = []
        temporary_array.push(list[i])
      else
        temporary_array.push(list[i].to_i)
        dish_array.push(temporary_array)
      end
    end
    dish_array
  end

  def add_dishes_to_order(dish_array, menu)
    dish_array.each do |item|
      menu.choose(item[0], item[1])
    end
  end

  def price_check(menu)
    menu.confirm_order(@customer_input_price)
  end
end
