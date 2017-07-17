require 'menu'
require_relative '../data/dishes.rb'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { DISHES }
  let(:menu_string) { dishes.map { |dish, price| "#{dish}, price = £#{price}" }.join("\n") }

  it 'should initialize and load a hash of dishes and prices' do
    expect(menu.dishes).to eq dishes
  end

  it 'should return the menu as a string' do
    expect(menu.to_s).to eq menu_string
  end

  context '#include?(dish)' do
    it 'should return true when the dish name is on the menu' do
      expect(menu.include?(dishes.keys.first)).to be true
    end
    it 'should return false when the dish name is not on the menu' do
      expect(menu.include?("Spaghetti")).to be false
    end
  end
end
