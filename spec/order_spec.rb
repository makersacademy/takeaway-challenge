require 'order'

describe Order do

  describe '#add' do
    it 'adds items to basket' do
      subject.add("item", 3)
      expect(subject.basket).to eq({ "item" => 3})
      end
   end

  describe '#basket_total' do
  it "calculates current order total" do
      subject.add("Ramen", 10)
      expect(subject.basket_total).to eq 100
      end
  end
end
