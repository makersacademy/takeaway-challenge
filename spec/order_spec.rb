require 'order'

describe Order do

  xit {is_expected.to respond_to(:add)}

  describe '#add' do
    it 'add item to basket' do
      subject.add("item", 2)
      expect(subject.basket).to eq({"item" => 2})
    end
  end

  describe '#basket_total' do
    it "calculates current order total" do
      subject.add("Burger", 5)
      expect(subject.basket_total).to eq 25
    end
  end
end
