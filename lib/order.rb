class Order

  # I could not add the order to @order = [] when referring to
  # global variable in initialize
  # I think it was because I forgot the curly brackets around the hash
  def initialize
    @order = []
  end

  def view_menu
    @menu = { "burger"=> 1, "fries"=> 2, "drink"=> 3, "side"=> 4 }
  end

  hash_test ={ :key_1=> "value 1", :key_2=> "value_2" }

  def order_item(item, quantity)
    # @order = []
    @order << { item: item, quantity: quantity.to_i }
  end

  def receipt
    @order.each do | item_and_quantity |
      item_and_quantity.each do | key1, item, key2, quantity |
        # I need to get the key value from @menu
        # so I can use the price to colculate the total
        p key1
        p key2
        p item
        p quantity
        puts "#{item} x#{quantity.to_i}: #{quantity.to_i * @order[1]}"
      end
    end
  end

end
