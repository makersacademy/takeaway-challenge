require 'menu'

describe Menu do

let(:menu) { described_class.new }
let(:dish) { "dosa" }
let(:price) { 5 }

describe '#initialize' do
  it 'starts with a list of dishes with their prices' do
    # expect(menu).to respond_to(:new).with(1).argument
    expect(menu.menu).to eq Menu::MENU
  end
end

describe '#price_list' do
  it 'responds to the #price_list method' do
    expect(menu).to respond_to :price_list
  end

  it 'displays a list of dishes with their price value' do
    expect(menu.price_list).to include( { dish => price } )
  end

end
end
