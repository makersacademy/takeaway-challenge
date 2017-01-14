require 'order'

describe Order do

  describe '#add' do
    it "raises error if item not on menu" do
      msg = "The requested item is not on the menu"
      expect { subject.add("eggs", 2) }.to raise_error(msg)
    end
    it "adds item to order" do
      subject.add("rice", 2)
      expect(subject.basket).to include { {"rice"=>2} }
    end
  end

  describe '#remove' do
    it "raises error if item not ordered" do
      msg = "You have not ordered this item"
      expect { subject.remove("eggs") }.to raise_error(msg)
    end
    it "removes item from order" do
      subject.add("rice", 2)
      subject.add("veg curry", 2)
      subject.remove("rice")
      expect(subject.basket).to eq({"veg curry"=>2})
    end
  end

  describe '#cancel' do
    it "cancels order" do

    end
  end

  describe '#place' do
    it "submits order" do

    end
  end

  describe '#show' do
    it "displays order" do

    end
  end

  describe '#confirm_to_customer' do
    it "confirms order has been placed" do

    end
  end

end
