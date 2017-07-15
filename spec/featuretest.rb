require_relative '../lib/takeaway'
require_relative '../lib/menu'

takeaway = Takeaway.new

# takeaway.menu
takeaway.menu
takeaway.new_order(1,2,2)

takeaway.breakdown

takeaway.confirm(+447743058608)
