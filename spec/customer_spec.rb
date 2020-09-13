require 'customer'

RSpec.describe Customer do 

let (:customer) { Customer.new }
let (:takeaway) { double('takeaway', :view => {}, :menu => {chicken: 4.99, chips: 1.50}) }
  
  it 'calls #view on instance of takeaway' do 
    expect(takeaway).to receive(:view)
    customer.view(takeaway)
  end 

  it 'customer can add item to basket' do 
    expect { customer.add("dish") }.to change { customer.basket.count }.by(1)
  end 
  
  it 'customer can add selection and price to basket array' do 
    expected = [ {:chicken => 4.99} ]
    expect(customer.add('chicken')).to eq(expected)
  end 

  it 'gives cutomer order total' do 
    customer.add('chicken')
    customer.add('chips')
    expect(customer.total).to eq 6.49
  end 

end 