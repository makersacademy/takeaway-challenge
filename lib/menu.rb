require_relative './takeaway.rb'

class Menu

  attr_reader :items

  def initialize
    @items = [{:pizza=>"£9"}, {:pasta=>"£7"}]
  end

end