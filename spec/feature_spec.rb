require 'takeaway'

describe 'User Stories' do 

# as a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'so I can check if I want to order something, I would like to see a list of dishes'do
  takeaway = Takeaway.new
  menu = Menu.new
  expect(takeaway.list_menu).to include ("Roast Pork Belly Hirata Buns")
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes


  # it 'so I can the meal I want, I would like select some number of dishes available'do
  # takeaway = Takeaway.new
  # menu = Menu.new
  # takeaway.select_item("Roast Pork Belly Hirata Buns")
  # expect(takeaway.order).to include ("Roast Pork Belly Hirata Buns")
  # end

end

