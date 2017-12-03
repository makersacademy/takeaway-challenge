require 'takeaway'

describe Takeaway do
  subject(:ta) { described_class.new }
  let(:menu) { double(:my_menu) }
  let(:sample_order) { "1,1\n2,3\n20.50" }
  let(:order_intermediate) { double(:my_order_intermediate, new: order) }
  let(:order) { double(:my_order, price: 20.50) }

  it 'takes orders as string' do
    expect(ta).to respond_to(:take_order).with(1).argument
  end

  it 'transforms order into order objects' do
    ta.take_order(sample_order, order_intermediate)
    expect(order.price).to eq 20.50
  end

  # it 'processes order correctly' do
  #   expect(ta.process_order(sample_order)).to eq [[1,1], [2,3], 20.50]
  # end

end
