require_relative '../lib/order.rb'

describe Order do
  subject(:order) { described_class.new(:dish) }
  let(:dish) { double(:dish) }

  it 'should show the current order' do
    expect(subject.current_order).to eq [:dish]
  end

  it 'should add a dish to the current order' do
    expect { subject.add_to_order(dish) }.to change { order.current_order.length }.by 1
  end
end
