require './lib/menu.rb'

describe Menu do
  subject(:menu) {described_class.new}
  let(:item_list) {[{:item=>"Pizza", :price=>5}, {:item=>"Burger", :price=>2}, {:item=>"Kebab", :price=>3}]}

  it 'shows you a list of menu items' do
    expect(menu.item_list).to eq item_list
  end
end
