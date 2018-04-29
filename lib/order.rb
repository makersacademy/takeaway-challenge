class Order

  attr_reader :list

  def initialize(menu = Menu.new, list = List.new)
    @menu = menu
    @list = list
  end

  def see_menu
    @menu.display
  end

  def add(item, number)
    raise 'item not on menu' if @menu.items.keys[item - 1].nil?
    @list.add_list(item, number)
  end

  def check_total(total)
    list.current_total(total)
    raise "actual total of items is £#{'%.2f' % @list.cost}" unless correct_total?(total)
    puts "£#{'%.2f' % total} is the correct order total"
  end

  private

  def correct_total?(total)
    @list.cost == total
  end

end
