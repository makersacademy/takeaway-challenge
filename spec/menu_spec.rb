require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { 'rice' }

describe '#show menu' do
  it 'returns the menu' do
  expect(subject.show_menu).to eq Menu::MENU
  end
end

describe '#has_dish?' do
  it 'return true if "rice" is passed' do
  expect(subject.has_dish?(dish)).to eq true
  end
end

describe 'dish_price' do
  it 'returns 1.95 as the price of Rice from the menu' do
    expect(subject.dish_price(dish)).to eq "£1.95"
  end
end

end
