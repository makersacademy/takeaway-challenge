class Order
  attr_accessor :total, :item_list, :food_item
  def initialize(food_item = FoodItem.new)
    @item_list = []
    @total = 0
    @food_item = food_item

  end

  def add_item(name)
    @food_item.add_item(name)
    add_order
    increment_total
  end

  def increment_total
    @total += @food_item.price
  end
  def show_total
    puts "Your total is #{@total}"
  end

  def add_order
    @item_list << @food_item.item_full
  end

  def show_list
    @item_list.each do |element|
      if element.class == Hash
        element.each do |value|

          puts "Item:  Price: #{value}"

      end
   end
  end
end

  def confirm
    require 'twilio-ruby'


    account_sid = 'ACec414f1e9a29d9f00e2435b8570aa21c'
    auth_token = '2e3baa8685fa98cfa134e97e6a09cab'
    @client = Twilio::REST::Client.new account_sid, auth_token


    @message = @client.account.messages.get('MM800f449d0399ed014aae2bcc0cc2f2ec')
    puts @message.body
    end
end
