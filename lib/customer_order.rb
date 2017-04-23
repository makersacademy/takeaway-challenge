require_relative './dish'
require_relative './menu'
require_relative './total_verifier'
require_relative './message_sender'
require_relative './order_processor'

require 'envyable'
Envyable.load('./config/env.yml', 'development')
require 'twilio-ruby'
require 'date'

class CustomerOrder

  def initialize(phone_number = nil, name = nil, contents = [])
    @phone_number = phone_number
    @contents = contents
    @name = name
    @my_total = 0
  end

  def add(*dish)
    dish.each { |dish|
    @my_total += dish.price
    @contents << dish
  }
  end

  def remove(*dish)
    dish.each { |dish|
    raise "That dish is not in this order" unless @contents.include?(dish)
    @my_total -= dish.price
    @contents.delete(dish)
  }
  end

  def order_count
    @contents.size
  end

  def show_contents
    @contents
  end

  def process
    @message, @full_message, @order_total = OrderProcessor.process(contents)
  end

  def complete_and_send_text
    MessageSender.send_text(@name, @phone_number, @full_message)
    "message sent successfully"
  end

  def cross_check_total
    TotalVerifier.verify(@my_total, @order_total)
  end

  private

  attr_reader :contents

end
