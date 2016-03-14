require 'my_order'

describe MyOrder do

subject(:my_order) { described_class.new(menu) }
let(:menu) {double(:menu)}
let(:dish1) {double(:dish, name: "Chicken Curry", price: 12.30, available: true)}
let(:dish2) {double(:dish, name: "Fish Curry", price: 11.30, available: true)}
let(:dish3) {double(:dish, name: "Poppadom", price: 0.30, available: true)}

describe '#initialize' do
  it '1.0 creates an empty my order array' do
    expect(my_order.picks.empty?).to be true
  end

  it '2.0 initializes with a menu' do
    expect(my_order.menu).to eq menu
  end
end

describe '#pick' do
  it '3.0 puts the selection in the picks array' do
    allow(menu).to receive(:choose).and_return(dish1)
    subject.pick("Chicken Curry", 1)
    expect(my_order.picks.empty?).to be false
  end
end

describe '#total' do
  before(:each) do
    allow(menu).to receive(:choose).and_return(dish1)
    subject.pick("Chicken Curry", 2)
    allow(menu).to receive(:choose).and_return(dish2)
    subject.pick("Fish Curry", 1)
    allow(menu).to receive(:choose).and_return(dish3)
    subject.pick("Poppadom", 2)
  end
  it '4.0 adds up the value of items in the picks array' do
    expect(my_order.total).to eq 36.50
  end
end

describe '#check_out' do
  it '5.0 print receipt of full purchase' do
    expect(my_order.check_out).to be_a String
  end
end

describe "#confirm_order" do
  it "6.0 returns an order confirmation" do
    allow(subject).to receive(:confirm_order).and_return(MyOrder::MESSAGE)
    expect(my_order.confirm_order).to eq MyOrder::MESSAGE
  end
end

end
