require 'dishes'
describe Dishes do
  let(:menu) { Dishes.new ({dish: 'Pizza', price: 5}) }
  describe '#list' do
    it 'shows a list of dishes and prices' do
      expect(menu.list).to eq({dish: 'Pizza', price: 5})
    end   
  end
end
