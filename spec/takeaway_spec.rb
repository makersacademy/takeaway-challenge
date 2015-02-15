require 'takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new                          }
  let(:pizza)    { double :dish , price: 4, name: 'pizza'}
  let(:pasta)    { double :dish, price: 2, name: 'pasta'}

  
  it "should be able to display a menu" do
    takeaway.menu_update(pizza)
    expect(takeaway.menu).to eq({'pizza' => '4£'})
  end 

  it "should be able to show the dishes selected and the total price" do
    takeaway.menu_update(pizza)
    takeaway.menu_update(pasta)
    takeaway.order  
    expect(takeaway.dishes_selected).to eq(['pizza', 'pasta'])
    expect(takeaway.total_price).to eq(8)
  end

  it "should be able to send a text message when the order is placed" do

  end
end