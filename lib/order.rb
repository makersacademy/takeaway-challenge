class Order

attr_accessor :list

  def initialize
    @list = {}
  end

  def current_order
    @list
  end

end
