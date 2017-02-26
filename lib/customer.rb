class Customer

  attr_reader :name, :method, :identification

  def initialize(name:, method:, identification:)
    @name = name
    @method = method
    @identification = identification
  end

  def send_order(order)
    order.send(self)
  end

end
