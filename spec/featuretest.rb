require_relative '../lib/takeaway'
require_relative '../lib/menu'

takeaway = Takeaway.new("order")

takeaway.menu

takeaway.new_order(1,1,2,3,3,3,4,4)

takeaway.breakdown

takeaway.confirm
