require 'twilio-ruby'
class Takeaway

  attr_reader :order_arr

  MENU = [
    {:code => "CTM", :dish => "Chicken Tikka Masala", :price => 5}, 
    {:code => "PPD", :dish => "Popadoms", :price => 1}, 
    {:code => "PM", :dish => "Paneer Masala", :price => 3}, 
    {:code => "CK", :dish => "Chicken Korma", :price => 4}, 
    {:code => "LC", :dish => "Lamb Curry", :price => 5}
  ]

  CODES = ["CTM", "PPD", "PM", "CK", "LC"]


  def initialize
    @order_arr = []
  end

  def menu
    MENU
  end

  def print_menu(menu)

    menu.each {
      |sub_hash|
      puts "#{sub_hash[:code]}: #{sub_hash[:dish]} - £#{sub_hash[:price]}"
    }
  end

  def order(code, quantity = 1)

    if CODES.include?(code)
      @order_arr.each {
        |hash|
        if hash.key?(code)
          hash[code] = hash.delete(code) + quantity
          return @order_arr
        end
      }
      @order_arr << {code => quantity}
    else
      puts "Please enter a valid item code from the menu"
      puts CODES
    end
  end

  def total
    grand_total = 0
    subtotals = []
    @order_arr.each {
      |order|
      order.each_key {
        |key|
        MENU.each {
          |item|
          if key == item[:code]
            subtotals << {key => order[key] * item[:price]}
          end
        }
      }
    }
    subtotals.each {
      |hash|
      hash.each_key {
        |key|
        grand_total += hash[key]
        puts "#{key} = £#{hash[key]}"
      }
    }
    puts "Total = £#{grand_total}"
  end

  def checkout
  
    account_sid = ENV["TWILIO_ACCOUNT_SID"] 
    auth_token = ENV["AUTH_TOKEN"]  

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Your order has been placed and will be with you within one hour",
      to: ENV["MOBILE_NUM"],    
      from: ENV["SENDER_NUM"])  

    puts "Your order has been placed!"
    
  end

end
