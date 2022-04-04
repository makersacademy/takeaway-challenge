class Order

    def contents
      @contents ||= []
    end
  
    def add(dish, amount)
      contents << { name: dish.name, price: dish.price, amount: amount }
    end
  
    def list
      contents.map.with_index do |ordered_dish, index|
        "#{index+1}. #{ordered_dish[:amount]}x #{ordered_dish[:name]} @ #{ordered_dish[:price]} each\n"
      end.join
    end
  
    def cost_array
      @cost_array ||= []
    end
  
    def add_to_cost_array
      contents.each do |ordered_dish|
        cost_array << ( ordered_dish[:price].slice(1..4).to_f * ordered_dish[:amount] )
      end
    end
  
    def sum
      "£" + sprintf('%0.2f', cost_array.inject(:+))
    end
  
  end