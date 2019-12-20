require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double(:menu, print: printed_dishes_with_prices) }
  let(:printed_dishes_with_prices) { "rice: £2.50" }
  let(:order) { double(:order)}
  let (:dishes) { {rice: 1 , chips: 2, fish: 1}}


  it "creates an instance of Takeaway" do
    expect(subject).to be_a Takeaway
  end

  it 'creates a list of dishes with prices' do
    expect(subject.dishes_with_prices).to eq(printed_dishes_with_prices)
  end
  it "orders a number of several available dishes" do
    expect(order).to receive(:add)
    subject.place_order(dishes)
  end


end
