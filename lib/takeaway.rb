
class Takeaway

attr_reader :menu, :ordered_dishes, :customer_order
@menu = []

  def initialize
    @customer_order = []
    @menu = [
      { dish: 'pasta', price: 10.00, category: 'main_nonveg_meal'},
      { dish: 'chickenwings', price: 20.00, category: 'main_nonveg_meal'},
      { dish: 'fries', price: 2.00, category: 'main_nonveg_meal'},
      { dish: 'beefburger', price: 5.00, category: 'main_nonveg_meal'}
    ]
  end

  def show_menu
    @menu.each do |item|
      item.each do |value|
        "#{value}"
      end
    end
  end

  def select_dishes
    @ordered_dishes = @menu.sample(3)
    @ordered_dishes.each { |item| item[:quantity] = 0}
    @ordered_dishes.each do |item|
      item.each do |k, v|
          if k == :quantity
          item[k] = rand(0..5)
          end
      end
      end
    @ordered_dishes
  end



  end

  # def order(selected_dishes_with_quantity)
  #   @ordered_dishes = {}
  #   @ordered_dishes[:dish] = dish
  #   @ordered_dishes[:quantity] = quantity
  #   @customer_order.push(@ordered_dishes)
  # end
