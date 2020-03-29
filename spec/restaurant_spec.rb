require 'restaurant'

describe Restaurant do
  let(:restaurant) { Restaurant.new }
  context 'toolbelt' do
    it 'should be able to hold the menu' do
      expect(restaurant).to respond_to(:todays_menu)
    end
    it 'should be able to hold the order' do
      expect(restaurant).to respond_to(:customer)
    end
  end
  context "entering the restaurant"
end
