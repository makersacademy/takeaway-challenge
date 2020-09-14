require 'customer'

RSpec.describe Order do 

  let(:order) { Order.new }
  let(:takeaway) { double('takeaway', :view => {}, :menu => { chicken: 4.99, chips: 1.50 }) }
  
  it 'customer can view menu' do 
    expect(order.view).to be_instance_of Hash
  end 

  it 'customer can add item to basket' do 
    expect { order.add_to_basket }.to change { order.basket.count }.by(1)
  end 
  
  it 'customer can select dish and add to basket' do 
    order.select_dish('chicken', 2, 4.99)
    expected = [{ 'chicken' => 2 }]
    expect(order.basket).to eq(expected)
  end 

  it 'gives cutomer order total' do 
    order.select_dish('chicken', 2, 4.99)
    expect(order.total).to eq 9.98
  end 

end
