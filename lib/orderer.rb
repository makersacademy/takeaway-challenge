class Orderer

  attr_reader :menu, :ordered

  def initialize(menu = [], messenger)
    @menu = menu.freeze
    @ordered = {}
    @messenger = messenger
  end

  def show_all_dishes
    all = ""
    menu.each_with_index do |dish, i|
      all << "#{ i }: #{ dish }\n"
    end
    all
  end
  
  def order(dish_id, amount)
    ordered[menu[dish_id]] = ( ordered[menu[dish_id]] || 0 ) + amount
  end

  def show_order
    total = 0.0
    ordered.inject(""){ |sum, (dish, amount)|
      total += dish.price * amount
      sum << "#{ dish }:\tx#{ amount }\tSubtotal:\t#{ dish.price * amount }"
    } + "\nTotal: #{ total }"
  end
  
  def order_total
    ordered.inject(0){ |sum, (dish, amount)| sum + (dish.price * amount) }
  end

  def confirm
    @messenger.send(show_order)
  end
end
