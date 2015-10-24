require_relative 'takeaway'

class Customer

  attr_reader :takeaway

  def initialize(takeaway_klass)
    @takeaway = takeaway_klass.new
  end

  def view_menu
    @takeaway.menu
  end



end
