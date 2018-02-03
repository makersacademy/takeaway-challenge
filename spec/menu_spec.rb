require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'has an instance variable `meals`' do
    expect(menu.instance_variable_defined?(:@meals)).to be true
  end

  describe '#meals' do
    it 'stores meals as a hash' do
      meals = {
        pappadom: 0.50,
        chutney: 0.50,
        samosa: 2.25,
        curry: 6.50,
        tandoori_grill: 8.95,
        veg_side: 2.75,
        rice: 1.95,
        naan: 1.80
      }
      expect(menu.meals).to include meals
    end
  end

end
