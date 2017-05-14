# Allows the user to confirm their selections before sending it.

require './lib/message_sender.rb'

class Order

  def initialize
    @summary = []
    @total_price = 0
    @confirmed = false
  end

  attr_reader :summary, :total_price, :confirmed


  def send
    if confirmed?
      message = "Thank you! Your order has been sent and will be delivered at #{get_delivery_time}"
      notify(message)
    else
      "Cannot send order: please confirm you order before sending"
    end
  end

  def confirm
    print_order
    puts "Confirm order? (Y/N)"
    gets_confirmation
    raise "Cannot confirm order: user confirmation required." unless confirmed?
    puts "Thank you for confirming your order."
   end

   def total
     calculate_total if price_is_zero?
   end

    def print_order
      total
      puts "You have ordered:"
      summary.each do |dish|
        puts "#{dish[:name]} @£#{dish[:price]} x#{dish[:quantity]}"
      end
      puts "The total is £#{total_price}"
    end

  private

  def gets_confirmation
    confirmation = gets.chomp
      self.confirmed = true if confirmation.upcase! == "Y"
   end

   def confirmed?
     confirmed
   end

   def price_is_zero?
     total_price == 0
   end

   def calculate_total
     summary.each do |dish|
       self.total_price += (dish[:price] * dish[:quantity])
     end
     total_price
   end

   def get_delivery_time
     delivery_time = DeliveryTime.new
     delivery_time.calculate
   end

   def notify(message)
     MessageSender.send_message(
     self.object_id, Information::TO, message)
      puts "Confirmation text sent"
      return "Confirmation text sent"
    end



  attr_writer :total_price, :confirmed
  attr_reader :time
end
