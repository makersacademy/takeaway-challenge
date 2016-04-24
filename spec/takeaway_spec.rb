require 'takeaway'

describe Takeaway do

  # it {is_expected.to respond_to(:show).with(1).argument}
  it {is_expected.to respond_to(:receive_payment).with(1).argument}

  let(:menu) { double :menu, get: dish1}
  let(:dish1) { double :dish1, name: "dish1", price: 3.5}

  let(:order_log_class) {double :order_log_class, new: order_log}
  let(:order_log) {double :order_log, add: nil}

  subject(:takeaway) {Takeaway.new menu, order_log_class}

  context "given name and quantity of a dish" do
    describe "#add_to_order" do
      it 'adds to order_log' do
        expect(order_log).to receive(:add).with("dish", 1)
        takeaway.add_to_order "dish", 1
      end
    end

    describe "#remove_from_order" do
      it 'removes from order_log' do
        expect(order_log).to receive(:remove).with("dish", 1)
        takeaway.remove_from_order "dish", 1
      end
    end
  end

  describe "checkout" do
    it 'raises eror if no dishes added' do
      expect{takeaway.checkout}.to raise_error{"nothing ordered yet"}
    end

  end








  # describe "#menu" do
  #   it 'lists available dishes and prices' do
  #     expect(takeaway.menu).to eq menu
  #
  #   end
  # end
  #
  # describe "#add_to_order" do
  #   context "when item not on menu" do
  #     it 'raises error' do
  #       order = :non_menu_item
  #       err_msg = "we ain't got #{order}"
  #       expect{takeaway.add_to_order order}.to raise_error err_msg
  #     end
  #   end
  #
  #   context "when item/s on menu" do
  #     it 'returns value of single item' do
  #       order = :item
  #       expect(takeaway.add_to_order order).to eq menu[order]
  #     end
  #
  #     it 'returns total value of mutiple items' do
  #       total = menu[:item] + menu[:item2]
  #       expect(takeaway.add_to_order :item, :item2).to eq total
  #     end
  #
  #     it 'additional items can be added' do
  #       total = menu[:item] + menu[:item2]
  #       takeaway.add_to_order :item
  #       expect(takeaway.add_to_order :item2).to eq total
  #     end
  #   end
  # end
  #
  # describe "check_order" do
  #   it 'returns current order as string' do
  #     takeaway.add_to_order :item
  #     msg = "Your order: #{:item}, "
  #     expect(takeaway.check_order).to eq msg
  #   end
  # end
end
