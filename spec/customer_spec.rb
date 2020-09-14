require 'customer'

RSpec.describe Customer do 

let (:customer) { Customer.new }
let (:takeaway) { double('takeaway', :view => {}, :menu => {chicken: 4.99, chips: 1.50}) }
  
  it 'customer can view menu' do 
    expect(customer.view).to be_instance_of Hash
  end 

  it 'customer can add item to basket' do 
    expect { customer.add_to_basket }.to change { customer.basket.count }.by(1)
  end 
  
  it 'customer can select dish and add to basket' do 
    customer.select_dish('chicken', 2, 4.99)
    expected = [ {'chicken' => 2} ]
    expect(customer.basket).to eq(expected)
  end 

  it 'gives cutomer order total' do 
    customer.select_dish('chicken', 2, 4.99)
    expect(customer.total).to eq 9.98
  end 

end 