require_relative 'menu'
require 'twilio-ruby'
require 'dotenv/load'

class TakeAway
  attr_reader :sms

  def initialize(menu: Menu.new)
    @todays_dishes = menu.view_list
    @basket = {}
    @summary = []
  end

  def view_menu
    @todays_dishes
  end

  def order
    puts "Please enter the dish (to finish your order, hit return twice)."
    @item = gets.chomp
    while @item.empty? == false do
      puts "Please enter the quantity."
      @quantity = gets.chomp.to_i
      puts "#{@quantity} x #{@item} added"
      @summary << "#{@quantity} x #{@item} = £#{subtotal}"
      @basket[@item] = @quantity
      puts "Please enter the dish (to finish your order, hit return twice)."
      @item = STDIN.gets.chomp
    end
    @basket
  end

  def view_summary
    @summary.join("; ")
  end

  def subtotal
    @todays_dishes.each { |dish, price|
      if @item == dish
        @subtotal = (@quantity * price)
      end
    }
    @subtotal
  end

  def total
    total = 0
    @basket.each { |item, quantity|
      @todays_dishes.each { |dish, price|
        if item == dish
          total += (quantity * price)
        end
      }}
    "Total = £#{total}."
  end

  def submit_order
    puts total + " If this is correct, enter 'yes' to submit your order"
    input = gets.chomp
    t = (Time.now.utc + 3600).strftime("%H:%M")
    @sms = "Thank you! Your order was placed and will be delivered before #{t}"
    if input == "yes"
      notify(@sms)
    else
      raise "The total is not correct. Please re-submit the order."
    end
  end

  private

  def notify(text)
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
      )

    client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['MOBILE'],
      body: text
      )
  end
end
