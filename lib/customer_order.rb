class CustomerOrder

  def initialize
    @contents = []
  end

  def add(order)
    @contents << order
  end

  def show_contents
    @contents
  end

  private
  attr_reader :contents

end
