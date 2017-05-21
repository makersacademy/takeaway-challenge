
require 'order'

describe Order do

  subject(:order) { described_class.new(:selected_dish) }

  let(:new_dish) { double(:new_dish) }

  it 'checks current order' do
    expect(order.current_order).to eq [:selected_dish]
  end

  it 'adds new dishes to the order' do
    expect { order.add(:new_dish) }.to change { order.current_order.length }.by 1
  end

end
