require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should display a menu' do
    expect(menu.display).to eq( { "Kebab" => 10, "Chips" => 2 } )
  end

  it 'should display a price' do
    expect(menu.price('Kebab')).to eq(10)
  end
end
