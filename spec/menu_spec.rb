require_relative '../lib/menu.rb'
describe Menu do

  let(:dishes) do {
    tofu: 2.50,
    falafel: 3.50,
    spaghetti: 2.99,
  }
  end

  subject(:menu) { described_class.new(dishes)}

  it 'has a list of avaible dishes' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'calculates a price' do
    expect(menu.price(:tofu)).to eq(dishes[:tofu])
  end

  describe "#show" do
    it 'shows menu list' do
      dishes_list = 'Tofu £2.50, Falafel £3.50, Spaghetti £2.99'
      expect(menu.show).to eq(dishes_list)
    end
  end

  describe "#include_dish?" do

    it 'checks if the dish is in menu' do
      expect(menu.include_dish?(:tofu)).to be true
    end

    it 'checks if the dish is not in menu' do
      expect(menu.include_dish?(:Kimchi)).to be false
    end
  end


end