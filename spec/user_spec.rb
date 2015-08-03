require 'user'

describe User do
  let(:diego) { User.new '+44 7496548640' }
  let(:diego_fake) {double(:diego_fake, :place_food_order => true, :food_menu_food_order => {} ) }
  let(:list) { double(:list) }
  let(:place_food_order) { double(:place_food_order) }


  it 'has a phone number' do
    expect(diego.phone).to_not be_empty
  end

  describe '#show_menu' do
    it 'shows Default-Dishes' do
      expect(diego.show_menu).to have_at_least(2).dishes
    end
    it 'corresponds to #available_menu' do
      expect(diego.show_menu).to eq diego.food_menu.available
    end
  end

  describe '#select_food_to_order' do
    it 'creates current #food_order' do
      diego.show_menu
      expect(diego.select_food_to_order(:risotto, :risotto)).to eq({:risotto => 2})
    end
  end

  describe '#place_food_order'
    it 'clears the #food_order hash' do
      diego.show_menu
      diego.select_food_to_order(:risotto, :risotto)
      diego_fake.place_food_order
      expect(diego_fake.food_menu_food_order).to be_empty
    end
end