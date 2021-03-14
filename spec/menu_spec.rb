require './lib/menu.rb'

describe Menu do
  let(:list) { [
    { dish: 'Shio Ramen', price: 5 },
    { dish: 'Shoyu Ramen', price: 6 },
    { dish: 'Miso Ramen', price: 7 },
    { dish: 'Spicy Ramen', price: 8 }
    ] }
  describe '#initialize' do
    it 'has a @menu variable' do
      expect(subject.list).not_to be_empty
    end
  end 
   describe '#see' do
     it 'shows list of dishes and prices' do
       expect(subject.see).to eq(list)
     end
   end
end
