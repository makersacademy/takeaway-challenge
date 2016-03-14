require_relative '../lib/takeaway.rb'

require 'pry'

t = Takeaway.new
binding.pry
t.see_dishes
t.add_to_order(fish, 3)
binding.pry
t.add_to_order(burger,5)

