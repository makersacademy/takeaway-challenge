class Order

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def complete?
    puts "#complete? @items = #{@items}"
    fail "quantity mismatch" if @items[0].values.inject(0, :+) != @items[1]
    load('./lib/send_sms.rb')
    true
  end

end
