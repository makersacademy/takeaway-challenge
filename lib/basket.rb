# Basket class
# instance initiated with empty contents list
# instance initiated with zero total 
# can have items added to it via Menu object
# can be asked to view its contents
# can be asked to check total
# can be asked to complete order

class Basket
  attr_reader :basket_contents, :basket_total

  def initialize
    @basket_contents = []
    @basket_total = 0
  end

  def add_to_basket(dish)
    @basket_contents << dish
    @basket_contents
  end

  def view_basket
    grouped_basket = group_and_sort_basket
    display_basket_by_dish(grouped_basket)
  end

  private

  def group_and_sort_basket
    @basket_contents.group_by { |item| item.name }.sort
  end

  def display_basket_by_dish(grouped_basket)
    grouped_basket.each do | dish_name, items |
      puts "Item: #{dish_name} Number: #{items.length} Subtotal: £ #{items.length * items.first.price}"
    end
  end

end
