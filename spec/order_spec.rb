require 'order'
require 'menu'

describe Order do

subject(:order) {Order.new}

it {is_expected.to respond_to :menu }
it {is_expected.to respond_to :order_summary}
it {is_expected.to respond_to(:add_order).with(2).argument}
it {is_expected.to respond_to :checkout}
describe '#add order' do
  let(:pizza) { double :pizza }
  it "orders 2 garlic bread" do
    order.add_order(:pizza, 2)
    expect(order.order_summary).to eq [:pizza, :pizza]
  end
end
end
