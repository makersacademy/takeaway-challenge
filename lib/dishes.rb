class Dishes

  attr_writer :menu, :order

  def initialize
    @menu = { "chow mein" => 2.99,
              "egg fried rice" => 1.99,
              "spring rolls" => 2.99
            }
    @order = []
  end

  def display_menu
    @menu.each { |key, value| "#{key}: £#{value}" }
  end

  def choose_dish dish
    fail "This item is not available on the menu" unless @menu.has_key?(dish)
    @order << dish
  end

  def total_order
    @order.length
  end

  def place_order
    fail "No items have been ordered, please order items" unless !@order.empty?
    send_sms_message
  end

  def send_sms_message

    require 'rubygems'
    require 'twilio-ruby'

    account_sid = 'ACd0d0e5cddebd43e42a64a2492a66c2e3'
    auth_token = '605656de1ad56cda8fa095192b5dfeb0'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441723282061',
      :to => '07764740151',
      :body => "Thanks for your order, it will be delivered before #{(Time.new + (60*60))}",
    })
  end

end