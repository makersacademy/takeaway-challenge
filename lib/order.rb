class Order

  attr_reader :items

  def initialize(menu = Menu.new)
    @items = {}
    @menu = menu
  end

  def add(dish, quantity)
    @items[dish] = quantity
  end

  def remove(dish)
    @items.each { |entry, _| @items.delete(entry) if entry == dish }
  end

  def has?(dish)
    @items.include?(dish)
  end

  def summary
    output = "Order Summary\n#{ "="*60 }\nDish#{ " "*32 }  Price   Qty"\
             "      Total\n" + "-"*60 + "\n"

    @items.each do |item, qty|
    output +=
      "#{ item.ljust(36) } £#{ format("%.2f",price(item)).rjust(5) } "\
      "#{ qty.to_s.rjust(5) }   £#{ format("%.2f",price(item)*qty).rjust(7) }\n"
    end

    output +=
      "="*60 + "\n" +
      "Total cost: £#{ format("%.2f",total_price).rjust(7) }".rjust(60)
  end

  private

    def price(item)
      @menu.price[item]
    end

    def total_price
      @items.inject(0) { |total, entry| total += price(entry[0])*entry[1]}
    end
end
