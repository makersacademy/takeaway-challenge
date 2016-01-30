class Takeaway

  attr_reader :menu, :basket


  def initialize
    @menu = {"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 }
    @basket = []
  end

  def display_menu
    @menu
  end

  def select_dishes(dish, num)
    @basket.push([dish, num])
  end

  def check(tot_customer)
    fail 'Total does not match!' if tot_customer != sum
    true
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
