require_relative 'menu'

module Order

  def add_to_order(item)
    item = item.upcase
    raise "Item not available" unless menu_list.include? item
    {item => read_menu[item]}
  end

end
