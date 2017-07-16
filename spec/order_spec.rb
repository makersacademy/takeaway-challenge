require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:order_test) {described_class.new(["Broccoli", "Beans"])}
  let(:test_items) {[{"broccoli"=>"3"}, {"beans"=>"3"}]}

  it 'has a method to allow customer to select menu items' do
    expect(order).to respond_to :select_items
  end

  it 'returns correct cost of items' do
    order_test.sum_items
    expect(order_test.cost).to eq 5
  end
end
