require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  it '#show should return the menu' do
    expect(menu.show).to include 'Burger: £3'
  end

  it '#listed should return true if item is available on the menu' do
    expect(menu.listed?('Burger')).to eq true
  end

  it '#listed should return false if item is not avaialbe on the menu' do
    expect(menu.listed?('MacNCheese')).to eq false
  end

end
