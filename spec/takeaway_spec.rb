require 'takeaway'


describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) { double "Menu"}
  let(:dish) { "Burrito" }
  let(:quantity) { 3 }

  it 'has a menu' do
    expect(takeaway.menu).to be_a Menu
  end

  it 'can view a menu' do
    expect(takeaway.read_menu(menu)).to eq menu
  end

  it 'is initialized with no orders' do
    expect(takeaway.orders).to be_empty
  end

  it 'can create a new order' do
    expect(takeaway.order(dish, quantity)).to be_a Order
  end
end
