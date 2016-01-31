require_relative 'messager'

class Takeaway

  attr_reader :menu, :basket


  def initialize (messager)
    @menu = {"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 }
    @basket = []
    @messager = messager
  end

  def display_menu
    @menu
  end

  def select_dishes(dish, num)
    fail "#{dish} is not on the menu" if @menu[dish].nil?
    @basket.push([dish, num])
  end

  def check(tot_customer)
    fail 'Total does not match!' if tot_customer != sum
    true
  end

  def complete_order
    send_text
    @basket = [] #because after check-out I need to restart from scratch!
    puts basket
  end

  def send_text
    @messager.send_text
  end

  private
  def sum
    total = 0
    @basket.each do |selection|
      key = selection[0]
      value = selection[1]
      amount = @menu[key] * value
      total += amount
    end
  total
  end

end
