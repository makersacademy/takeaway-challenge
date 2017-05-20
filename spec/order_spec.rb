require 'order'

describe Order do
  subject(:order) { described_class.new(:menu_item) }

  let(:new_item) { double(:new_item) }

  it { is_expected.to respond_to :current_order }

  it 'should show the users current order' do
    expect(order.current_order).to eq [:menu_item]
  end

  it 'can add other items to the order' do
    expect { order.add_to_order(:new_item) }.to change { order.current_order.length }.by 1
  end

end
