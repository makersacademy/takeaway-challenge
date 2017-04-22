class Menu

  attr_reader :cuisine

  def initialize
    @cuisine = { 'pho' => 5.99, 'bun' => 3.99, 'noodles' => 5.99 }
  end

end
