require 'menu'

describe Menu do

  subject(:menu) { Menu.new(options)}

  let(:options) { {doner: 4.00, shish: 3.50} }
  let(:printed_menu) {'Doner £4.00, Shish £3.50'}

  it 'contains the options that can be ordered' do
    expect(menu.options).to eq options
  end

  it 'shows the options that can be ordered' do
    expect(menu.show).to eq printed_menu
  end

  it 'checks if an option is on the menu' do
    expect(menu.has_option?(:doner)).to be true
  end

  it 'calculates a price' do
    expect(menu.price(:doner)).to eq(options[:doner])
  end

end
