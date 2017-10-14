require_relative 'takeaway'

class Menu

  attr_reader :list

  def initialize
    @list = {"curry" => 1.00, "xcurry" => 1.00}
  end

end
