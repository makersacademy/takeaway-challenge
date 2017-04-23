class CurrentOrder

  attr_accessor :current_order

  def initialize
    $current_order = []
  end

  def show
    puts $current_order
  end

end
