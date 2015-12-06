require 'rubygems'
require 'twilio-ruby'
require 'yaml'

class Order

  def initialize
    @dishes = []
    @total = 0
    @number_dishes = 0
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
      @tokens = YAML::load(File.open('./lib/resources/tokens.yml'))
      client = Twilio::REST::Client.new @tokens["account_sid"], @tokens["auth_token"]
      client.account.messages.create(
      :from => @tokens["from_number"],
      :to => @tokens["to_number"],
      :body => "Your order should arrive by #{delivery_time}!" )
    end
    true
  end

  def number_dishes
    @dishes.each { |dish| @number_dishes += dish[:quantity] }
    @number_dishes
  end

  def delivery_time
    ready_at = Time.now + (number_dishes * 5 + 10)*60
    ready_at.hour.to_s+":"+ready_at.min.to_s
  end

  private

  def update_total(dish)
    @total += (dish[:price] * dish[:quantity])
  end

  def readable_dishes
    string = ""
    @dishes.each do |dish|
      string += "#{dish[:quantity]}x #{dish[:name]} £#{dish[:price]}\n"
    end
    string
  end

end
