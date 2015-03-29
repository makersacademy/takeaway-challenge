require 'order'

describe Order do

  let(:order) {Order.new}
  let(:menu) { double :menu, :present_menu => 'bread *** 3' }
    

  it "can add menu" do
    expect(order).to receive(:add_menu)
    order.add_menu
  end 

  it "can have menu" do
    order.add_menu menu
    expect(order.menu).to eq menu
  end  

  it "can present a menu" do
    order.add_menu menu
    expect(order.present_menu).to eq 'bread *** 3'
       
  end  
  
  it "can pick items form the menu" do
    order.pick_items("fish", "salad")
    expect(order.order_list).to eq ["fish", "salad"]

  end

  it "can prsent the total price of the picked items" do
    order.pick_items("fish", "salad")
    expect(order.total_price).to eq 13
  end
  
  xit "can execute the oreder and send text" do
  end  
end