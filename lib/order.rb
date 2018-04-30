class Order

  attr_reader :list

  def initialize(menu = Menu.new, confirm = Confirm.new)
    @menu = menu
    @confirm = confirm
  end

  def see_menu
    @menu.display
  end

  def add(item, number)
    raise 'item not on menu' if @menu.items.keys[item - 1].nil?
    @menu.add_to_order(item, number)
    puts "you have added #{number} #{@menu.items.keys[item - 1]} to your order"
  end

  def view_order
    @menu.see_list
  end

  def check_total
    @menu.total
  end

  def complete_order(total)
    raise 'total input is not equal to order' unless total == @menu.total
    text
  end

  private

  def text
    @confirm.send_text
  end

end
