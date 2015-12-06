require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  it 'allows customers to view the menu items' do
    expect{ menu.items }.not_to raise_error
  end


end
