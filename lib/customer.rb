require_relative 'menu.rb'

class Customer

  attr_reader :mobile

  include Menu

  def initialize(mobile)
    @mobile = mobile
  end


end