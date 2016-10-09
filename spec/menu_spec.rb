require 'menu'

describe Menu do

  before do
    @filepath = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.csv'
    @price = 5.95
    @name = "Margherita"
    allow(menu).to receive(:create_dish) {dish}
    menu.load_dishes
  end

  let(:dish){ double("Dish", name: @name, price: @price) }

  subject(:menu) { described_class.new(@filepath)}

  it 'should load dishes into the dishes array' do
    expect(menu.dishes[0]).to eq dish
  end

  it 'should load the correct number of dishes' do
    count = open(menu.filepath).readlines.size
    expect(menu.dishes.length).to eq count
  end

  it 'should build the array to display the menu' do
    menu.menu_display
    expect(menu.menu_array[0]).to eq "1. Margherita  £5.95"
  end

end
