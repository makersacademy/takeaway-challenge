require 'customer'

RSpec.describe Customer do 

let (:customer) { Customer.new }
let (:takeaway) { double('takeaway', :view => {}) }
  
  it 'customer can view menu' do 
    expect(customer.view(takeaway)).to be_instance_of Hash
  end 

  it 'customer can add item to basket' do 
    expect { customer.add("dish") }.to change { customer.basket.count }.by(1)
  end 
  
end 