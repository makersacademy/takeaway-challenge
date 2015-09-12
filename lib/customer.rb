class Customer
  attr_writer :basket

  def initialize
    @basket = []
  end

  def view_menu(takeaway)
    takeaway.menu
  end

  def place_order(takeaway, _item)
    fail 'Sorry that item is not on the menu' if takeaway.menu.key?(_item) == false
    @basket << _item
  end

  def view_basket
    @basket
  end
end
