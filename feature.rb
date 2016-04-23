require_relative './lib/takeaway'

chineese = Takeaway.new

p chineese

p chineese.menu #<= should return a hash {item: 1}


p chineese.add_to_order :item, :item2
