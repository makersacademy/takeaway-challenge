require 'order'

describe Order do
  subject(:order) { Order.new(menu) }
  let(:options) { {doner: 1, shish: 2} }
  let(:menu) { double(:menu) }


  before do
    allow(menu).to receive(:has_option?).with(:doner).and_return(true)
    allow(menu).to receive(:has_option?).with(:shish).and_return(true)
  end

  it 'selects options from the menu' do
    order.add(:doner, 1)
    order.add(:shish, 2)
    expect(order.options).to eq options
  end

  it 'doesn\'t allow options to be added that are not on the menu' do
    allow(menu).to receive(:has_option?).with(:chicken).and_return(false)
    expect { order.add(:chicken, 1) }.to raise_error NoOptionError, "Chicken is not on the menu."
  end
end
