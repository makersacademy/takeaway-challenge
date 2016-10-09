require 'take_away_menu'
require 'order'

describe TakeAwayMenu do
  subject(:menu) {described_class.new}

  it 'has a list of dishes for the customer to view' do
    expect(menu).to respond_to :list_dishes
  end

  it "has 2 items on the menu" do
    expect(subject.items.length).to eq(5)
  end

  it 'has 4 items on the menu' do
    expect(subject.items.length).to eq(5)
  end

  it 'lets you find the price of an item' do
    #menu = {'pasta' => 5, 'chips' => 2, 'salad' => 4, 'soup' => 5}
   expect(subject.items['pasta']).to eq 5
   end

end
