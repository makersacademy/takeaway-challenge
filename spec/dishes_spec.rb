require 'dishes'
describe Dishes do
  let(:menu) { Dishes.new ({dish: 'Pizza', price: 5}) }
  describe '#list' do
    it 'shows a list of dishes and prices' do
      expect { menu.list }.to output('Pizza: £5').to_stdout
    end   
  end
end


