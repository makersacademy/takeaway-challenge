class Checkout

def price_breakdown
  @basket.map do |item, quantity|
    "#{item} x #{quantity} = £#{@takeaway.menu[item] * quantity}"
  end
end

def final_price
  @basket.map do |item, quantity|
  @total += @takeaway.menu[item] * quantity
end
"Your final toal comes to £#{@total}"
end
