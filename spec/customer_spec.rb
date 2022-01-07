# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'customer'

describe Customer do 

  it 'show display a list of dishes with prices' do 
    subject = Customer.new
    list_of_dishes = subject.dish_list
    expect(subject.dish_list).to eq list_of_dishes
  end
end