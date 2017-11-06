require 'order'
require 'food_item'
describe Order do
  let(:food_code) {'cola'}
  describe "#show_total" do
    it "shows_total" do
      expect(subject.show_total).to eq (0)
    end
  end
  describe "#add_item" do
    it "adds item to array" do
        expect { subject.add_item(food_code) }.to change { subject.item_list.count }.by(1)

    end
    it "increments the total" do
      expect { subject.add_item(food_code) }.to change { subject.total }.by(1)
    end

  end

  describe "#show_list" do
    xit "prints list" do
      expect(subject.show_list).to be_kind_of(String)
    end
  end
  describe "#add_order" do
    it "adds order to array" do
      expect { subject.add_order }.to change { subject.item_list.count }.by(1)
    end
  end
end
