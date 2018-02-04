require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  let(:meals) do
    { pappadom: 0.50,
      chutney: 0.50,
      samosa: 2.25,
      curry: 6.50,
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
      printed_menu = "1. pappadom : £0.50\n2. chutney : £0.50\n3. samosa : £2.25\n4. curry : £6.50\n5. rice : £1.95\n6. naan : £1.80\n"
      expect { menu.print }.to output(printed_menu).to_stdout
    end
  end

  describe '#price' do
    it 'returns price for specified menu item' do
      expect(menu.price(:chutney)).to eq 0.5
    end
  end

end
