
class Order
  attr_reader :cart, :name, :mobile_no, :total, :item, :completed
  attr_writer :completed
  def initialize(name,house_no,street,postcode,mobile_no)
    @name = name
    @house_number = house_no
    @street = street
    @postcode = postcode
    @mobile_no = mobile_no
    @cart = []
    @total = 0
    @completed = false
  end

  def add_to_cart(menu,item,quantity)
    fail 'Item not in Menu' unless
      menu.menu_items.map(&:item).include?(item[0])
    @cart << [item,quantity]
    @total += ((item[1].gsub(/[^\d,\.]/, '').to_f) * quantity)
  end

  def del_from_cart(item,quantity)
    del_error_checks(item)
    cart.delete([item,quantity])
    @total -= ((item[1].gsub(/[^\d,\.]/, '').to_f) * quantity)
  end

  def clear_cart
   @cart = []
   @total = 0
  end

  private

  def del_error_checks(item)
    fail 'Item not in cart' unless @cart.flatten.include?(item[0])
    fail 'Cart is empty' if @total <= 0
  end

end
