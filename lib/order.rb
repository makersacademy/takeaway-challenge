require 'dotenv/load'

class Order
  def initialize(text_message_client_class:)
    @dishes = []

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @sending_number = ENV['TWILIO_NUMBER']

    @text_message_client = text_message_client_class.new(account_sid, auth_token)
  end

  def check_order
    return nil if dishes.empty?

    cost_summary + "\nTOTAL: £#{format("%<num>0.2f", num: total_price)}"
  end

  def add_dishes_to_order(menu, *dish_numbers)
    raise 'Order has already been submitted.' if @submitted

    dish_numbers.each { |dish_number|
      dishes << menu.get_dish(dish_number)
    }
  end

  def submit_order(mobile_phone_number)
    raise 'Order has already been submitted.' if @submitted
    
    response = send_confirmation_text(mobile_phone_number)
    raise "Error sending text: error code #{response.error_code}" unless response.error_code.nil?

    @submitted = true
  end

  private
  
  attr_reader :dishes
  
  def total_price
    dishes.reduce(0) { |sum, dish|
      sum + dish.price
    }
  end

  def cost_summary
    dishes.map { |dish|
      dish.to_s
    }.join("\n")
  end

  def send_confirmation_text(mobile_phone_number)
    @text_message_client.messages
      .create(
        body: "Thank you! Your order was placed and will be delivered before #{one_hour_from_now}",
        from: @sending_number,
        to: mobile_phone_number
      )
  end

  def one_hour_from_now
    (Time.now + 3600).strftime('%R')
  end
end
