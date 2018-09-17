require './lib/menu'

describe Menu do

  describe '#menu' do
    it "defines the method" do
      expect(subject).to respond_to(:menu)
    end

    it "stores the items and prices in array of hashes" do
      expect(subject.menu).to eq [
        { item: "Noodles", price: 6.00 },
        { item: "Prawn Cocktail", price: 3.80 },
        { item: "Prawn Crackers", price: 1.80 },
        { item: "Deep Fried Seaweed", price: 4.00 }
      ]
    end
  end

  describe '#show_menu' do
    it "defines the method" do
      expect(subject).to respond_to(:show_menu)
    end

    it "formats the menu" do
      allow(subject.show_menu).to receive(:show_menu) { "#{i + 1}. #{k[:item]}: £#{k[:price]}" }
    end
  end

  describe '#select' do
    it "defines the method" do
      expect(subject).to respond_to(:select)
    end

    it "Choose two items" do
      expect(subject.select).to eq([
        {:item=>"Noodles", :price=>6.0},
        {:item=>"Prawn Cocktail", :price=>3.8}
      ])
    end
  end

  describe '#order_total' do
    it "defines the method" do
      expect(subject).to respond_to(:order_total)
    end

    it "Prints the order amount to pay" do
      allow(subject.order_total).to receive(:order_total) { "Your total is £#{@menu}0." }
    end
  end
end
