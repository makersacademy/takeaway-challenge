# As a customer
# So that I can order the meal I want
# I would like to be able to select
# some number of several available dishes


require './lib/takeaway.rb'
takeaway = Takeaway.new
takeaway.menu
takeaway.place_order("Dal Tadka","Naan")
