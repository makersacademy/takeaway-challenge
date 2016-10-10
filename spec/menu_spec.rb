require 'menu'

describe Menu do

  let(:takeaway) { double :takeaway }
  let(:menu) { double(:menu, show: dishes_list) }
  let(:dishes_list) { "item: £2.00" }
  let(:@dishes) do
    {'item': 2.00}
  end

  it {is_expected.to respond_to(:do_we_have).with(1).argument}

  it 'has a menu list' do
    expect(menu.show).to eq(dishes_list)
  end

  it 'should know what is on the menu' do
    allow(menu).to receive(:do_we_have).and_return(true)
    expect(menu.do_we_have('item')).to eq(true)
  end

end
