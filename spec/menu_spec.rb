require 'menu'

describe Menu do
  let(:menu) { described_class.new('./lib/fake_menu.csv') }
  
  describe '#to_s' do
    it 'returns a formatted menu from correclty loaded csv' do
      expect(menu.to_s).to eq("#{"Welcome to Bob's Burritos!".rjust(57)}\n\n#{"Beef Burrito".rjust(40)} - dish: 1 -" + "#{"£10.00".rjust(8)}\n#{"Chicken Burrito".rjust(40)} - dish: 2 -" + "#{"£9.00".rjust(8)}\n#{"Veggie Burrito".rjust(40)} - dish: 3 -" + "#{"£8.00".rjust(8)}")
    end
  end

  describe '#dish_info' do
    it 'returns the name and price of a dish at index' do
      expect(menu.dish_info(2)).to eq(["Veggie Burrito", 8.00])
    end
  end
end
