require 'order'

describe Order do

  context 'new order' do
    
    it 'new order has empty array' do
     expect(subject.basket).to eq []
    end
  end

end
