require 'order'

describe Order do

  let(:burger) { double("burger", name: "burger", price: "15") }
  let(:pasta) { double("pasta", name: "pasta", price: "10") }
  let(:menu) { double("menu", :dishes_list => [burger, pasta])}
  let(:restaurant) { double("restaurant", menu: menu) }

  describe "#add" do
    it "adds an item to the order" do
      subject.add(burger, 1)
      expect(subject.items).to eq({ "burger" => 1 })
    end

    it "can add any number of an item" do
      subject.add(pasta, 3)
      expect(subject.items).to eq({ "pasta" => 3})
    end

    it "increases the number of items of a same type" do
      subject.add(burger, 2)
      subject.add(pasta, 1)
      subject.add(burger, 1)
      expect(subject.items).to eq({ "burger" => 3, "pasta" => 1})
    end
  end

  describe '#remove' do

  end

  describe '#items' do

  end

  describe '#close' do
    
  end

  describe '#total_price' do
    
  end

  describe '#time' do
    
  end
end
