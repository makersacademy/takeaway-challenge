require "order"

describe Order do
  let (:dishes) { double :dishes }

  it 'responds to' do
    is_expected.to respond_to(:input)
    is_expected.to respond_to(:add_item).with(2).arguments
    is_expected.to respond_to(:place)
    is_expected.to respond_to(:total)

  end
  it 'adds item and quantity to item_list' do
    allow(dishes).to receive(:new).and_return(dishes)
    allow(dishes).to receive(:dish_list).and_return(dishes)
    allow(dishes).to receive(:keys).and_return(dishes)
    allow(dishes).to receive(:[]).with(0).and_return('Pizza')
    o = Order.new(dishes)
    o.add_item(1, 2)
    expect(o.item_list).to eq("Pizza" => 2)
  end

  it 'calculates 20 for 2 pizzas as total' do
    allow(dishes).to receive(:new).and_return(dishes)
    allow(dishes).to receive(:dish_list).and_return(dishes)
    allow(dishes).to receive(:keys).and_return(dishes)
    allow(dishes).to receive(:[]).with(0).and_return('Pizza')
    allow(dishes).to receive(:values).and_return(dishes)
    allow(dishes).to receive(:[]).with('Pizza').and_return(10)
    o = Order.new(dishes)
    o.add_item(1, 2)
    expect(o.total).to eq(20)
  end

  it "does not raise error with correct total" do
    allow(dishes).to receive(:new).and_return(dishes)
    allow(dishes).to receive(:dish_list).and_return(dishes)
    allow(dishes).to receive(:keys).and_return(dishes)
    allow(dishes).to receive(:[]).with(0).and_return('Pizza')
    allow(dishes).to receive(:values).and_return(dishes)
    allow(dishes).to receive(:[]).with('Pizza').and_return(10)
    o = Order.new(dishes)
    o.add_item(1, 2)
    expect { o.place(20) }.not_to raise_error
  end
end
