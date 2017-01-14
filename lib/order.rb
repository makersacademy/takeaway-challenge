module Order
  include Menu

  def add_to_order(item)
    raise "Item not available" unless read_menu.include? item
    {item => read_menu[item]}
  end

end
