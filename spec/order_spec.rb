require 'order'

describe Order do 
  let(:order) { described_class.new }
  let(:test_basket) { Order.new({ :pizza => 1, :chips => 2 }) }
  


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

  describe '#remove_item' do 
    context 'When passed and item and quantity' do 
      it "removes item from basket" do 
        expect(test_basket.remove_item("chips", 1)).to eq({ :pizza => 1, :chips => 1 })
      end 
    end
    context 'When passed item and nil quanitity' do 
      it "Clears item from basket" do 
        expect(test_basket.remove_item("pizza")).to eq({ :chips => 2 })
      end 
    end 
  end

  describe '#complete_order' do 
    it "completes order and gives latest delivery time" do 
      expect(test_basket.complete_order).to eq("Thank you! Your order was placed and will be delivered before #{Time.new + 3600}")
    end 
    it "returns error if basket is empty" do 
      expect { order.complete_order }.to raise_error "Nothing in basket"
    end 
  end 
end
