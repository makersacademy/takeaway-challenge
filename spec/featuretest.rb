require_relative '../lib/takeaway'
require_relative '../lib/menu'

takeaway = Takeaway.new()

takeaway.menu

takeaway.new_order(1, 2, 2, 3, 4, 4, 4)

takeaway.breakdown

# takeaway.confirm(mobile_number)
