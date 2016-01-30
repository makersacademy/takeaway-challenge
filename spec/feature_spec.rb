require 'takeaway'

describe 'User Stories' do 
# as a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'so I can check if I want to order something, I would like to see a list of dishes'do
  takeaway = Takeaway.new
  pretty_menu =takeaway.list_menu
  expect{ takeaway.list_menu }.to output(pretty_menu).to_stdout 
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes


  it 'so I can the meal I want, I would like select some number of dishes available' do
  takeaway = Takeaway.new
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  takeaway.select_item("Salt & Pepper Squid",2)
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  expect(takeaway.order).to eq ["Roast Pork Belly Hirata Buns", "Salt & Pepper Squid", "Salt & Pepper Squid", "Roast Pork Belly Hirata Buns"]
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'so I can verify my order, check that the total I have been given matches the sum of the various dishes in my order' do
  takeaway = Takeaway.new
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  takeaway.select_item("Salt & Pepper Squid",2)
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  summary = "Your order summary is:\n 2 x Roast Pork Belly Hirata Buns, £10\n 2 x Salt & Pepper Squid, £8\n Total cost: £18"
  message = "payment does not match total price, please try again"
  expect{takeaway.place_order(15)}.to raise_error message
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it 'so I can verify my order, check that the total I have been given matches the sum of the various dishes in my order' do
  takeaway = Takeaway.new
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  takeaway.select_item("Salt & Pepper Squid",2)
  takeaway.select_item("Roast Pork Belly Hirata Buns")
  thank_you_message ="Thank you! Your order was placed and will be delivered before 20:00"
  allow(takeaway).to receive(:one_hours_time) {"20:00"}
  expect(takeaway.place_order(18)).to eq thank_you_message
  end

end

