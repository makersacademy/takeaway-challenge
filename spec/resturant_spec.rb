require 'resturant'

describe Resturant do 

  it 'should have a list of dishes' do
  resturant = Resturant.new 
  list = resturant.dish
  expect(resturant.dish).to eq list
  end 
  it 'customers choice of order' do
    subject = Resturant.new 
    customer = Customer.new 
    subject.customer_choice(customer.select_dish("Pasta"))
    expect(subject.choice).to eq [["Pasta"]]
  end 
  it 'should give the right total' do 
    subject = Resturant.new 
    customer = Customer.new 
    subject.customer_choice(customer.select_dish("Pasta"))
    expect(subject.total).to eq 5
  end 
end 