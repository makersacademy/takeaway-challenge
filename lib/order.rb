require_relative 'menu'
require_relative 'takeaway'

class Order 

    attr_reader :current_order, :item

    def initialize
        current_order = []
    end

end

