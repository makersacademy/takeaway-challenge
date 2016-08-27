require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#show' do
    it 'returns a list of dishes and prices' do
      expect(menu.show_dishes).to include(
        "Banana Chowder" =>  5.45,
        "Hedgeree" => 7.65,
        "Thai Green Jelly" => 4.95,
        "Mackerel Muffins" => 3.75,
        "Smoked Goat Tart" => 6.75,
        "Prawn Sundae" => 6.75
      )
    end
  end

end
