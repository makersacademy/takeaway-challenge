class OrderForm

  attr_reader :tab, :menu_reference
  attr_accessor :total

  def initialize(menu_reference)
    @tab = []
    @total = 0
    @menu_reference = menu_reference
  end

  def add(item, quantity = 1)
    quantity.times do
      tab << item
      self.total = self.total + menu_reference.menu[item]
    end
  end

  def remove(item, quantity)
    quantity.times do
      tab.delete(item)
      self.total = self.total - menu_reference.menu[item]
    end
  end

  def place_order
    your_order = "Your Order".center(30)
    puts your_order
    puts

    tab.each do |item|
      price = menu_reference.menu[item]
      receipt = "#{item}".ljust(15, '-') + "$#{price}".rjust(15, '-')
      #receipt_total = receipt_total + menu_reference.menu[item]
      puts receipt
    end
    closing = "The total will be $#{self.total}. Kindly make payment after verifying that it matches the sum of the prices of the dishes that you ordered."

    puts
    return closing
  end

  def pay(amount)
    if amount == self.total
      puts "We've received payment for your order of $#{self.total}. A text message will be sent to you to confirm your order and delivery time"
      time = Time.new
      dtime = time + 3600
      delivery_time = dtime.strftime("%I:%M%p")

      Texter.new.send_message("Thanks for ordering! Your meal will be delivered to you by #{delivery_time}", "+44 07482606928", "+44 1254313397")
    else
      fail "Please pay the correct amount"
    end
  end


end