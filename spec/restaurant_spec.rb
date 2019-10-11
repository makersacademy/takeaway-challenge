require 'Restaurant'

describe Restaurant do

  describe '#initialize' do

    it 'can display a menu with items and prices' do
      menu = {
        'chicken_burgers' => 2.50,
        'beef_burgers' => 2.50,
        'chips' => 1.00
      }

      expect(subject.menu).to include(menu)
    end
  end
end
