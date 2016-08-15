require 'order'

describe Order do

  let(:order) { described_class.new }
  let(:order_total) { double(:order_total) }

  it 'should initialize with instance of menu' do
    expect(order.menu).to be_instance_of(Menu)
  end

  it 'should show the menu to the customer' do
    expect(order.show_menu).to eq Menu::MENU
  end

  it 'should store an order' do
    expect(order.take(0, 4)).to eq [{'0. Chicken RUBY Murry' => 5}, {"4. GUI Chocolate Pudding" => 5}]
  end

  it 'should raise an error if the customer picks something not on the menu' do
    expect{order.take(5)}.to raise_error(RuntimeError, "That item is not on the Menu!")
  end

  it 'should add the order cost to the end of the order' do
    order.take(1, 3)
    order.add_cost_to_order
    expect(order.order).to eq [{{"1. HASH Browns" => 4} => 1, {"3. Steak and Onion API" => 7} => 1}, {'Total' => 11}]
  end

  it 'should change duplicate dishes into a new hash with a quantitiy' do
    order.take(1, 3, 1, 3, 2)
    order.add_cost_to_order
    expect(order.order).to eq([{{"1. HASH Browns" => 4} => 2, {"3. Steak and Onion API" => 7} => 2, {"2. Deep PRYed Prawns" => 6} => 1}, {'Total' => 28}])
  end

end
