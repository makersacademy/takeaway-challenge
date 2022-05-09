require 'basket'

describe Basket do
  let(:basket) { Basket.new }
  it 'starts with an empty basket' do
    expect(basket.basket).to eq({})
  end 

  it 'starts with a balance of 0' do
    expect(basket.total).to eq(nil)
  end

  describe '#add' do
    it 'can add an item to the basket' do
      expect { basket.add("pizza", 1) }.to change { basket.basket }.from({}).to({ "pizza" => 1 })
    end

    it 'can add multiple items to the basket' do
      expect { basket.add("chips", 5) }.to change { basket.basket }.from({}).to({ "chips" => 5 })
    end
  end

  describe '#show_basket' do
    it 'shows what is currently in the basket' do
      basket.add("burger", 1)
      basket.add("pizza", 2)
      expect(basket.show_basket).to eq("burger x 1, pizza x 2")
    end
  end

  describe '#checkout' do
    it 'shows the total cost of the order' do
      basket.add("burger", 4)
      basket.add("pizza", 2)
      expect(basket.checkout).to eq("The total cost will be £48")
    end
  end
end
