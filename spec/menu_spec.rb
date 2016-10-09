require 'menu'

describe Menu do

  before do
    @filepath = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.csv'
    allow(menu).to receive(:create_dish) {:dish}
    menu.load_dishes
  end

  let(:dish){ double("Dish") }

  subject(:menu) { described_class.new(@filepath)}

  it 'should load dishes into the dishes array' do
    expect(menu.dishes[0]).to eq :dish
  end

  it 'should load the correct number of dishes' do
    count = open(menu.filepath).readlines.size
    expect(menu.dishes.length).to eq count
  end

end
