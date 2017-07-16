require_relative 'textbot'

class Order

  def initialize(textbot = Textbot.new)
    @basket = []
    @textbot = textbot
  end

  def order(item, amount)
    amount.times { @basket << item }
    puts "Added #{amount} #{item} to your order"
  end

  def basket
    @basket
  end

  def checkout(amount)
    @textbot.sendmessage(amount)
  end

private

end
