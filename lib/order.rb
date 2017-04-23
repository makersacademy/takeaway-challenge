require_relative 'current_order'
class Order

  attr_reader :running
  attr_accessor :new, :current

  def initialize
    $running = false
  end

  def start
    $running = true
    $current = CurrentOrder.new
  end

  def running?
    $running
  end
end
