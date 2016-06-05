require_relative 'confirm'

class Order

  def initialize(menu)
    @basket = []
    @orders = []
    @menu = menu
    @confirm = Confirm.new
  end

  def add(dish)
    raise "That dish isn't on the menu, please try again." if !@menu.dishes.include?(dish)
    @basket << dish
    quantity = @basket.count(dish)
    "#{quantity}x #{dish}, £#{ sprintf('%.2f', (@menu.dishes[dish] * quantity))} - added to your basket"
  end

  def basket
    check_basket
    @basket.sort
  end

  def view_basket
    check_basket
    printout = ""
    item_count.each {|key,value| printout << "#{value}x #{key}, £#{sprintf('%.2f', value * @menu.dishes[key])}\n" }
    printout
  end

  def total
    check_basket
    item_count
    subtotal = item_count.map { |key, value| item_count[key] * @menu.dishes[key] }
    total = sprintf('%.2f', subtotal.inject(0){|sum,x| sum + x })
    "Total: £#{total}"
  end

  def checkout
    check_basket
    @orders << [view_basket, final = total]
    reset_basket
    @confirm.send_sms
    "Order received, #{final}"
  end

  private

  def check_basket
    raise "Nothing in basket" if @basket.empty?
  end

  def item_count
    item_count = @basket.each_with_object(Hash.new(0)) { |item, hash| hash[item] += 1 }
  end

  def reset_basket
    @basket = []
  end

end
