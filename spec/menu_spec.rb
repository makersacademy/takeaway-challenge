require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  it '#dishes' do
    expect(menu).to receive(:dishes).and_return Array
    menu.dishes
  end
end
