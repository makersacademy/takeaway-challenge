require 'dotenv/load'
class Order

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def complete?
    fail "quantity mismatch" if @items[0].values.inject(0, :+) != @items[1]
    load('./lib/success_sms.rb')
  end

end
