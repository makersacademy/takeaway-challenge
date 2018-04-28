class Restaurant

def initialize(menu = Menu.new, messager = Messager.new)

def complete_order(price)
  correct_price?(price)
  send_text("Thank you for your order, your total is #{total_price}")
end

def send_text(text)
  #call API
end


private
def correct_price?(price)
  total_price == price
end

end
