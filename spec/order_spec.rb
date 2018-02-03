require 'order'

describe Order do

  subject(:order)       { described_class.new }
  let(:selection)       { double "a hash of selections" }
  let(:provided_total)  { double "the total provided" }

  it "initializes with a menu hash" do
    expect(order.menu).to be_instance_of Hash
  end

  describe "#select_menu_items" do
    it "stores the estimated total in @provided_total" do
      expect { order.select_menu_items(selection, provided_total) }
        .to change { order.provided_total }.to provided_total
    end

    it "stores the selection in @selection" do
      expect { order.select_menu_items(selection, provided_total) }
        .to change { order.selection }.to selection
    end
  end

  describe "#validate_order" do
    let(:test_order) { { tofu: 2, quorn: 1, tempeh: 3, seitan: 1 } }
    let(:test_order_total_cost) { 17 }
    let(:incorrect_test_order_total_cost) { 16 }
    # let(:test_order) { order.menu }
    # let(:test_order_total_cost) {
    #   order.menu.each_value.map { |v| v ** 2 }.inject(&:+)
    #   }
    # let(:incorrect_test_order_total_cost) { test_order_total_cost - 1}
    context "once an order has been created" do
      context "when provided_total is correct" do
        before :each do
          order.select_menu_items(test_order, test_order_total_cost)
        end
        it "returns provided_total" do
          expect(order.validate_order).to eq test_order_total_cost
        end
      end

      context "when provided_total is incorrect" do
        before :each do
          order.select_menu_items(test_order, incorrect_test_order_total_cost)
        end
        it "raises 'Incorrect total provided' error" do
          expect { order.validate_order }.to raise_error "Incorrect total provided"
        end
      end
    end
  end
end
