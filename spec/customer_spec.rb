
require 'customer'

describe Customer do 
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'show display a list of dishes with prices' do 
    subject = Customer.new
    list_of_dishes = subject.dish_list
    expect(subject.dish_list).to eq list_of_dishes
  end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
it 'should allow selection of several available dishes' do 
  subject = Customer.new
  subject.select_dish("Chips")
  subject.select_dish("Garlic Bread")
  expect(subject.select_dish("Chips")).to eq ["Garlic Bread", "Chips", "Chips"]
end 
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
it 'check that the total matches the sum of the various dishes order' do
  subject = Customer.new 
  subject.select_dish("Chips")
  subject.select_dish("BBQ Wings(4)")
  subject.select_dish("BBQ Wings(4)")
  subject.select_dish("Chips")
  expect(subject.amount).to eq 18
end 
end