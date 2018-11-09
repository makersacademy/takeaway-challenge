require_relative 'dishes'

class Takeaway

  attr_reader :view_dishes

  def initialize(dishes)
    @view_dishes = dishes
  end

end
