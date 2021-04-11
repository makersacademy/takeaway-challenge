require 'dishes'
class Takeaway 
  attr_reader :available_dishes

  def initialize
    @available_dishes = {}
  end

  def menu
    p @available_dishes = {$name => $price} if $available
  end

end