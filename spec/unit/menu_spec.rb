require 'menu'

RSpec.describe Menu do
  let(:menu_file) { 'menu.csv' }
  let(:new_menu) { described_class.new(menu_file) }

  it 'returns price of a dish' do
    expect(new_menu.price?('Monkey pie')).to eq 5
  end

  it 'outputs a hashed_menu' do
    expect(new_menu.hashed_menu).to eq [{ :item => "Vegetable pie", :price => 2 }, { :item => "Lamb pie", :price => 3 }, { :item => "Steak pie", :price => 3 }, { :item => "Kangaroo pie", :price => 4 }, { :item => "Dog pie", :price => 1 }, { :item => "Monkey pie", :price => 5 }, { :item => "Whale pie", :price => 6 }]
  end

end
