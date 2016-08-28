require 'restaurant'

describe Restaurant do

  subject(:restaurant) {described_class.new}
  let(:menu) {double(:menu)}

  describe '#display_menu' do
  it 'prints menu' do
    menu = Menu.new
    expect(subject.display_menu).to include("Thai Green Curry")
  end
  end

  describe '#order_food' do

  it 'allows customer to order food on menu' do

  end

  xit 'shows the price' do

  end

 xit 'confirms the order and price' do

 end

 end

  end
