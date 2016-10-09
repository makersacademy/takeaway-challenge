require 'menu'

describe Menu do

  subject(:menu) { Menu.new(options)}

  let(:options) { {doner: 4.50, lamb: 4.99} }

  it 'contains the options that can be ordered' do
    expect(menu.options).to eq options
  end

end
