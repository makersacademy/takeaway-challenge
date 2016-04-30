require_relative './menu'

class Customer

attr_reader :menu, :basket, :phone_number

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @running_total = 0
    @phone_number = "+447880521694" # change this to an arg for customer
  end

  def read_menu
    menu.list
  end

  def order(item:, quantity:)
    quantity.times do | times |
      @basket << menu.list.select { |k,v| k == item }
    end
  end

  def checkout(expected_total)
    @basket.each do |item|
      @running_total += @menu.list[item.keys[0]]
    end
    if @running_total != expected_total
      raise "Your expected total amount due is not correct. Please try to checkout again"
    else
      print "Order complete, thanks!"
      self.complete
    end
  end


def complete(confirmation = Confirmation.new(phone_number))
  confirmation.send
end

end