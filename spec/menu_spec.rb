require 'menu'

describe Menu do
  describe '#display' do
    it 'displays items in the menu' do
      expect(subject.display).to eq({ "katsu curry" => 7.50,
       "nanban chicken" => 7.50,
       "tonkotsu ramen" => 10.00,
       "nasi lemak" => 8.00,
       "mapo tofu" => 7.50,
       "massaman curry" => 8.00,
       "karaage chicken" => 5.00,
       "korean fried chicken" => 5.00,
       "soju" => 6.00,
       "iced tea" => 3.00,
      })
    end
  end

  describe '#has?' do
    context 'checks if the menu contains the item' do
      it 'returns true if the menu does have the item' do
        expect(subject.has?("soju")).to eq(true)
      end

      it 'returns false if the menu does not have the item' do
        expect(subject.has?("something")).to eq(false)
      end
    end
  end

  describe '#price' do
    it 'returns the price of a dish' do
      expect(subject.price("soju")).to eq(6.00)
    end
  end
end
