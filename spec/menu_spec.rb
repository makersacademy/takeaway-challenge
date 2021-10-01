require "menu"

describe Menu do
  describe "#see_list" do
    # let (:dish) { double "dish", name: name, price: price }
    it "returns a list of dishes" do
      expect(subject.see_list()).to eq subject.list
    end
  end

  describe "#place_order" do
    # let (:dish) { double "dish", name: name, price: price }
    it "creates a list of selected dishes" do
      subject.place_order(1, 2)
      expect(subject.order).to eq subject.list.slice(1, 2)
    end
  end
end
