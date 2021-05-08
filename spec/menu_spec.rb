require 'menu'

describe Menu do

  let(:items) do
    described_class::DEFAULT_MENU.map { |dish, price| "#{dish.to_s.capitalize}: £#{price.round(2)}" }
  end

  subject(:menu) { described_class.new } 

  it 'prints a menu with dishes and prices' do
    expect(menu.display).to eq(items)
  end
end