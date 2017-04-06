require 'order'

describe Order do

  describe '#add' do
    it "raises error if item not on menu" do
      msg = "The requested item is not on the menu"
      expect { subject.add("eggs", 2) }.to raise_error(msg)
    end
    it "adds item to order" do
      subject.add("rice", 2)
      expect(subject.basket.items).to include { {"rice"=>2} }
    end
  end

  describe '#remove' do
    it "raises error if item not ordered" do
      msg = "You have not ordered this item"
      expect { subject.remove("eggs", 1) }.to raise_error(msg)
    end
    it "removes item from order" do
      subject.add("rice", 2)
      subject.add("veg curry", 2)
      subject.remove("rice", 2)
      expect(subject.basket.items).to eq({"veg curry"=>2})
    end
  end

  describe '#cancel' do
    it "cancels order" do
      subject.add("rice", 2)
      subject.add("veg curry", 2)
      subject.cancel
      expect(subject.basket).to be_a Basket
    end
  end

  describe '#buy' do
    it "confirms to customer" do
      subject.add("rice", 2)
      subject.add("veg curry", 2)
      expect(subject).to respond_to(:buy).with(0).arguments
    end
  end

  describe '#view' do
    it "displays order" do
      expect(subject).to respond_to(:view).with(0).arguments
    end
  end

end
