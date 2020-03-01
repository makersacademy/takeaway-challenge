#Feature test

require './lib/takeaway'

takeaway = Takeaway.new
takeaway.create_order
takeaway.add_to_order("pizza", 2)
takeaway.finish_order
