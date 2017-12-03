require_relative '../lib/order.rb'

describe Order do
  subject(:order) { described_class.new(:dish, 5) }
  let(:dish) { double(:dish) }

  it 'should show the current order' do
    expect(subject.current_order).to eq [:dish => 5]
  end

  it 'should add a dish to the current order' do
    expect { subject.add_to_order(:dish, 5) }.to change { order.current_order.length }.by 1
  end

  it 'should calculates the total for the current order' do
    order.add_to_order(:dish, 5)
    order.add_to_order(:dish, 5)
    expect(order.order_total).to eq 15
  end
end
