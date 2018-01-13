require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double :menu }


  it 'stores an item in the basket when ordered' do
    order.add_item("Fish", 1)
    expect(order.basket).to include ("Fish")
  end

end
