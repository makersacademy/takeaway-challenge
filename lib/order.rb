class Order
  attr_reader :item_list, :dishes

  def initialize(dish_class = Dishes)
    @item_list = {}
    @dishes = dish_class.new
  end

  def input
    quantity_to_order, item_to_order = 'test'
    while item_to_order != '' and quantity_to_order != '' do
      puts 'Enter index of dish. Hit enter twice to finish'
      item_to_order = gets.chomp
      puts 'Enter quantity'
      quantity_to_order = gets.chomp
      if item_to_order != '' and quantity_to_order != '' then
        add_item(item_to_order, quantity_to_order)
      end
    end
  end

  def confirm
    puts 'Enter total amount to confirm'
    estimated_total = gets.chomp
    place(estimated_total.to_i)
  end

  def add_item(item_index, quantity)
    @item_list.store(@dishes.dish_list.keys[item_index.to_i - 1], quantity.to_i)
  end

  def total
    sum = 0
    @item_list.each do |x|
      sum += @dishes.dish_list[x[0]].to_i * x[1].to_i
    end
    return sum
  end

  def place(estimated_total)
    raise 'Wrong totals - restart' if total != estimated_total.to_i

    puts 'Your order was placed and will be delivered within one hour'
  end
end
