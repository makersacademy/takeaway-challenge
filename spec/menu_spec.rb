require './lib/menu.rb'

describe Menu do
  subject(:menu) {described_class.new}
  let(:item_list) {[{:item=>"Pizza", :price=>5}, {:item=>"Burger", :price=>2}, {:item=>"Kebab", :price=>3}]}

  it 'shows you a list of menu items' do
    expect(menu.item_list).to eq item_list
  end

  describe '#show_menu' do
    it 'prints out a list of menu items' do
      expect { menu.show_menu }.to output("  Dish -- Price\n" +
              "1. Pizza -- £5\n" +
              "2. Burger -- £2\n" +
              "3. Kebab -- £3\n").to_stdout
    end
  end
end
