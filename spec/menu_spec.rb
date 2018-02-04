require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  let(:meals) do
    { pappadom: 0.50,
      chutney: 0.50,
      samosa: 2.25,
      curry: 6.50,
      grill: 8.95,
      rice: 1.95,
      naan: 1.80
    }
  end

  it 'has an instance variable `meals`' do
    expect(menu.instance_variable_defined?(:@meals)).to be true
  end

  describe '#meals' do
    it 'stores meals as a hash' do
      expect(menu.meals).to include meals
    end
  end

  describe '#print' do
    it 'outputs items from menu' do
      printed_menu =
        "1. pappadom : £0.50"
        "2. chutney : £0.50"
        "3. samosa : £2.25"
        "4. curry : £6.50"
        "5. grill : £8.95"
        "6. rice : £1.95"
        "7. naan : £1.80"
      expect(menu.print).to eq printed menu
    end
  end

  describe '#price' do
    it 'returns price for specified menu item' do
      expect(menu.price(:chutney)).to eq 0.5
    end
  end

end
