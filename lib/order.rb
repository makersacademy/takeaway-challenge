require 'rubygems'
require 'twilio-ruby'
require 'yaml'

class Order

  def initialize
    @dishes = []
    @total = 0
  end

  def add(dish)
    update_total(dish)
    @dishes << dish
  end

  def review
    "Your order:\n"+readable_dishes+"Total price: $"+@total.to_s
  end

  def dishes
    @dishes.dup
  end

  def place(send_text = true)
    if send_text
      tokens = YAML::load(File.open('./lib/tokens.yml'))
      account_sid = tokens["account_sid"]
      auth_token = tokens["auth_token"]
      client = Twilio::REST::Client.new account_sid, auth_token
      client.account.messages.create(
      :from => tokens["from_number"],
      :to => tokens["to_number"],
      :body => "Your order will arrive in 30 minutes!" )
    end
    true
  end

  private

  def update_total(dish)
    @total += (dish[:price] * dish[:quantity])
  end

  def readable_dishes
    string = ""
    @dishes.each do |dish|
      string += "#{dish[:quantity]}x #{dish[:name]} $#{dish[:price]}\n"
    end
    string
  end

end
