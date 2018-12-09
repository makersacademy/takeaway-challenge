require 'order'

RSpec.describe Order do

  subject(:order) { described_class.new }
  let(:menu_double) { double(:menu) }

  it 'allows the user to add items and their quantity to the order' do
    expect(order.add("steak", 2)).to include("steak" => 2)
  end

  it 'sums up how much the user has to pay' do
    allow(menu_double).to receive(:display).and_return({ "steak" => 10, "ravioli" => 20, "augbergine salad" => 5 })
    order.add("steak", 2)
    order.add("ravioli", 3)
    expect(order.total_to_pay).to equal 80
  end

end
