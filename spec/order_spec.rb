require 'order'

describe Order do

  describe '#add' do
    it 'add item to basket' do
      subject.add("item", 2)
      expect(subject.basket).to eq({ "item" => 2 })
    end
  end

  describe '#basket_total' do
    it "calculates current order total" do
      subject.add("Burger", 5)
      expect(subject.basket_total).to eq 25
    end
  end

  describe '#order_summary' do
    it "prints summary for each item" do
      subject.add("Burger", 5)
      expect { subject.order_summary }.to output("5x Burger: £25\n").to_stdout
    end
  end
end
