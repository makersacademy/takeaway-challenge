require 'customer'

RSpec.describe Customer do 

let (:customer) { Customer.new }
let (:takeaway) { double('takeaway', :view => {}) }
  
  it 'calls #view on instance of takeaway' do 
    expect(takeaway).to receive(:view)
    customer.view(takeaway)
  end 

  it 'customer can add item to basket' do 
    expect { customer.add("dish") }.to change { customer.basket.count }.by(1)
  end 
  
end 