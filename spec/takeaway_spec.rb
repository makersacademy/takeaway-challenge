require 'takeaway'

describe Takeaway do

  it {is_expected.to respond_to(:check_order)}

  subject(:takeaway) {Takeaway.new}

  let(:menu) {{item: 7, item2: 4}}

  describe "#menu" do
    it 'lists available dishes and prices' do
      expect(takeaway.menu).to eq menu

    end
  end

  describe "#add_to_order" do
    context "when item not on menu" do
      it 'raises error' do
        order = :non_menu_item
        err_msg = "we ain't got #{order}"
        expect{takeaway.add_to_order order}.to raise_error err_msg
      end
    end

    context "when item/s on menu" do
      it 'returns value of single item' do
        order = :item
        expect(takeaway.add_to_order order).to eq menu[order]
      end

      it 'returns total value of mutiple items' do
        total = menu[:item] + menu[:item2]
        expect(takeaway.add_to_order :item, :item2).to eq total
      end

      it 'additional items can be added' do
        total = menu[:item] + menu[:item2]
        takeaway.add_to_order :item
        expect(takeaway.add_to_order :item2).to eq total
      end
    end
  end

  describe "check_order" do
    it 'returns current order as string' do
      takeaway.add_to_order :item
      msg = "Your order: #{:item}, "
      expect(takeaway.check_order).to eq msg
    end
  end
end
