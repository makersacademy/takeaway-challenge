require 'customer'

describe Customer do
  let(:menu) { double :menu, list: nil }
  let(:texter) { double :texter, send: nil }
  let(:order) { double :texter }
  subject(:customer) { described_class.new(menu, order) }

  it 'should set menu when creating a Customer' do
    expect(subject.menu).to eq menu
  end

  context 'select dishes' do
    it 'should allow the customer to choose a dish' do
      result = { Pie: 1 }
      allow(menu).to receive(:items).and_return(result)
      subject.choose(:Pie)
      expect(subject.order_items).to eq result
    end
  end
end
