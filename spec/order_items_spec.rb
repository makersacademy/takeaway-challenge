require 'order_items'

describe OrderItems do

  let(:burger) { double("burger", name: "burger", price: 15) }
  let(:pasta) { double("pasta", name: "pasta", price: 10) }
  let(:sushi) { double("sushi", name: "sushi", price: 22) }
  let(:menu) { double("menu", :dishes => [burger, pasta]) }
  let(:restaurant) { double("restaurant", menu: menu) }

  subject { OrderItems.new(menu) }

  describe "#add" do
    it "adds an item to the order" do
      subject.add(burger, 1)
      expect(subject.list).to eq({ "burger" => 1 })
    end

    it "can add any number of an item" do
      subject.add(pasta, 3)
      expect(subject.list).to eq({ "pasta" => 3 })
    end

    it "increases the number of list of a same type" do
      subject.add(burger, 2)
      subject.add(pasta, 1)
      subject.add(burger, 1)
      expect(subject.list).to eq({ "burger" => 3, "pasta" => 1 })
    end

    it "raises an error if dish not on the menu" do
      expect { subject.add(sushi, 2) }.to raise_error "This dish is not available"
    end

    it "raises an error if the order is closed" do
      subject.lock
      expect { subject.add(burger, 1) }.to raise_error "This order is closed"
    end
  end

  describe '#remove' do
    it 'removes an item from the order' do
      subject.add(burger, 3)
      subject.remove(burger, 1)
      expect(subject.list).to eq({ "burger" => 2 })
    end

    it 'can remove several list of a kind at once' do
      subject.add(burger, 3)
      subject.remove(burger, 2)
      expect(subject.list).to eq({ "burger" => 1 })
    end

    it "removes the entry if number of list <= 0" do
      subject.add(burger, 3)
      subject.remove(burger, 3)
      expect(subject.list).to eq({})
    end

    it "raises an error if entry not in list" do
      expect { subject.remove(burger, 1) }.to raise_error "No burger currently in order"
    end

    it 'raises an error if the order is closed' do
      subject.lock
      expect { subject.remove(burger, 2) }.to raise_error "This order is closed"
    end
  end

  describe '#list' do

  end

  describe '#locks' do
    it "locks the list" do
      subject.lock
      expect(subject).to be_locked
    end
  end

  describe '#total_price' do
    
  end

  describe '#time' do
    
  end
end
