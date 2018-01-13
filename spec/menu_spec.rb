require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'has a menu with prices' do
    expect(menu.list).to eq ["Fish: £2365", "Chips: £1836", "Kebab: £4317"]
  end
end
