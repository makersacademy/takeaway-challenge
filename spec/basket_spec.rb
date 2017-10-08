require 'basket'
describe Basket do
  let(:basket) { Basket.new }
  let(:item) { double("fake_item", :price => 3) }
  let(:another_item) { double("another_fake_item", :price => 2) }

  it "creates an empty hash upon initialization" do
    expect(basket.selected_items).to eq({}) 
  end

  describe "#add_item" do
    context "when item is nil" do
      it ".selected_items does not add item" do
        basket.add_item(nil)
        expect(basket.selected_items).not_to include(nil)
      end
    end

    context "when quantity is a negative number" do
      it ".selected_items does not add item" do
        basket.add_item(item, -4)
        expect(basket.selected_items).not_to include(:item)
      end
    end

    context "when quantity is not negative and item not nil" do
      before(:each) do
        basket.add_item(item)
      end
      it ".selected_items should have a key item" do
        expect(basket.selected_items).to include(item)
      end
      it ".select_items should have value of 1 on key :item" do
        expect(basket.selected_items[item]).to eq 1
      end
      it ".select_items should increase the value of key item" do
        basket.add_item(item, 2)
        expect(basket.selected_items[item]).to eq 3
      end
    end
  end

  describe "#remove_item" do
    before(:each) do
      basket.add_item(item, 5)
    end
    context "when item is nil" do
      it ".selected_items should remain the same" do
        hash_before = basket.selected_items.clone
        basket.remove_item(nil)
        expect(basket.selected_items).to eq hash_before
      end
    end

    context "when quantity is a negative number" do
      it ".selected_items should remain the same" do
        hash_before = basket.selected_items.clone
        basket.remove_item(item, -6)
        expect(basket.selected_items).to eq hash_before
      end
    end

    context "when quantity given is greater than the value " do
      it ".selected_items should remain the same" do
        hash_before = basket.selected_items.clone
        basket.remove_item(item, 6)
        expect(basket.selected_items).to eq hash_before
      end
    end

    context "when quantity is not negative and item not nil" do
      it ".selected_items[item] should become 3" do
        basket.remove_item(item, 2)
        expect(basket.selected_items[item]).to eq 3
      end
      it ".selected_items[another_item] should not change the hash" do
        hash_before = basket.selected_items.clone
        basket.remove_item(another_item)
        expect(basket.selected_items).to eq hash_before
      end
    end
  end

  describe "#calculate_total" do
    it "should return the total price of items in selected items" do
      basket.add_item(item, 2)
      basket.add_item(another_item, 2)
      expect(basket.calculate_total).to eq 10
    end
  end
end