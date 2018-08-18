require 'orders'

describe Orders do

  it 'responds to 2 arguments' do
    expect(subject).to respond_to(:cust_order).with(2).arguments
  end

  it "can place multiple orders" do
    subject.cust_order("pie", 3)
    subject.cust_order("chips", 2)
    expect(subject.orders).to eq({ pie: 3, chips: 2 })
  end

  it "raises an error if dish is not on the menu" do
    expect { subject.cust_order('chicken', 2) }.to raise_error "sorry, dish is not available"
  end

  it 'returns the price of an item' do
    menu_items = { pie: 4.50 }
    expect(subject.price("pie")).to eq 4.50
  end
end
