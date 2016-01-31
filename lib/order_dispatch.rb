# require_relative 'takeaway'
require_relative 'order'
require 'dotenv'

class OrderDispatch
  def initialize
    @credentials = Dotenv.load
  end

  def new_order(order)
    # TODO: send text
  end
end
