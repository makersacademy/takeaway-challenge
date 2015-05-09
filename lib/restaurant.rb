require_relative 'customer.rb'

class Restaurant

  attr_accessor :dishes

  def initialize
    @dishes = {:Rice => 1.50, :Naan => 2.00, :Vindaloo => 5.00 }
  end

end