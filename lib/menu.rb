class Menu
  attr_reader :list, :order

  def initialize
    @list = {
      1 => ["cod", "£5"],
      2 => ["fishcake", "£4"],
      3 => ["chips", "£3"]
    }
    @order = []
  end

  def see_list
    @list
  end

  def place_order(item)
    @order = @list.slice(item)
    # .each {|dish| dish.key = item ? @order.push(@list[dish]) : nil }
  end
end
