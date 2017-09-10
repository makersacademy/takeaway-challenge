require 'takeaway'
require 'order'
require 'menu'

describe Takeaway do
  subject(:takeaway) {described_class.new(order, menu)}
  let(:order) {double :order}
  let(:menu) {double :menu}

  context '#initialize' do
    it 'begin with a new order' do
      expect(takeaway.order).not_to be_nil
    end

    it 'begins with a new menu' do
      expect(takeaway.menu).not_to be_nil
    end
  end

  it 'can print the Italian menu' do
    expect(takeaway.menu).not_to be_empty
  end

  it 'can add the order to the list' do
    allow(order).to receive(:add)
    expect(takeaway.add_to_list).to eq [{:pasta => 10}]
  end
end
