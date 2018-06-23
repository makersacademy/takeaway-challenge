require 'order'

describe Order do

  it { is_expected.to respond_to(:list_options) }

  let(:order)         { described_class.new(menu) }
  let(:menu)          { double :menu, new: options }
  let(:options)       { double :options, options: "chicken" }

  it 'initializes with a menu' do
    expect(order.menu).to eq options
  end

  it 'shows the options' do
    expect(order.list_options).to eq "chicken"
  end

end
