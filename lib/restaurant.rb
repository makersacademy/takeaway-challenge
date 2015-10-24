require_relative 'cuisines'

class Restaurant

  attr_reader :menu
  include Cuisines

  def initialize(type)
    @menu = CUISINES[type]
  end

end
