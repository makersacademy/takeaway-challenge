require 'menu'

describe Menu do

  subject(:menu) { Menu.new(options)}

  let(:options) { {doner: 4.50, lamb: 4.99} }
  let(:printed_menu) {'Doner £4.50, Lamb £4.99'}

  it 'contains the options that can be ordered' do
    expect(menu.options).to eq options
  end

  it 'shows the options that can be ordered' do
    expect(menu.show).to eq printed_menu
  end
end
