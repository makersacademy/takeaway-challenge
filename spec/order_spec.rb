require 'order'

describe Order do 
  let(:order) { described_class.new }
  let(:test_basket) { Order.new({ :pizza => 1, :chips => 2 })}
  

  
  describe '#add_to_basket' do 
    it "Adds multiple items to basket with quantity" do 
      expect(test_basket.basket).to eq({ :pizza => 1, :chips => 2 })
    end
  end 

  describe '#total_price' do 
    it "Shows total price of items in basket" do 
      expect(test_basket.total_price).to eq(16.97)
    end 
  end  
end
