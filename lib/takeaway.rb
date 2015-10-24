# require 'takeaway_texts'

class Takeaway
  attr_reader :name, :number

  def initialize(name='no_name',
                 number='+447479365828'
                 )
    @name = name
    @number = number
  end

  def new_order
  end

end
