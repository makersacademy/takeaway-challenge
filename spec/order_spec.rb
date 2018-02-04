require 'order'

describe Order do

  subject(:order)      { described_class.new }
  let(:menu)           { order.menu }
  let!(:correct_item)  { menu.keys.sample }
  let!(:correct_item2) { menu.reject { |key| key == correct_item }.keys.sample }
  let(:incorrect_item) { double("an incorrect item", to_sym: :"incorrect item") }
  let(:quantity)       { 3 }

  it "initializes with a menu hash" do
    expect(menu).to be_instance_of Hash
  end

  it "initializes with an empty selection hash" do
    expect(order.selection).to eq({})
  end

  describe "#add" do
    context "when item is part of menu" do
      context "when item has been chosen in this order before" do
        before :each do
          order.add(correct_item, 1)
        end

        it "adds correct number of correct item to @selection" do
          expect { order.add(correct_item, quantity) }.to change { order.selection[correct_item] }.by quantity
        end
      end

      context "when item is chosen for the first time in this order" do
        it "adds correct number of correct item to @selection" do
          expect_string = "#{quantity} x #{correct_item} "\
          "= £#{quantity * menu[correct_item.to_sym]}"
          expect(order.add(correct_item, quantity)).to eq expect_string
        end
      end
    end

    context "when item is not part of menu" do
      it "raises 'Item not on menu' error" do
        expect { order.add(incorrect_item, quantity) }.to raise_error "Item not on menu"
      end
    end
  end

  describe "#basket_summary" do
    context "when basket is not empty" do
      before :each do
        correct_item_test_amount = 2
        correct_item2_test_amount = 3
        order.add(correct_item, correct_item_test_amount)
        order.add(correct_item2, correct_item2_test_amount)
      end
      it "returns formatted basket summary string" do
        expect_string = "#{order.selection[correct_item]} x #{correct_item} "\
        "= £#{order.selection[correct_item] * menu[correct_item.to_sym]}, "\
        "#{order.selection[correct_item2]} x #{correct_item2} "\
        "= £#{order.selection[correct_item2] * menu[correct_item2.to_sym]}"
        expect(order.basket_summary).to eq expect_string
      end
    end

    context "when basked is empty" do
      it "raises 'Basket empty' error" do
        expect { order.basket_summary }.to raise_error "Basket empty"
      end
    end
  end

  describe "#total" do
    let(:order_total) {
      amount = order.selection.map { |item, quantity| quantity * menu[item] }.inject(&:+)
      "£#{amount}"
    }
    before :each do
      20.times { |num| order.add(menu.keys.sample, num) }
    end
    it "returns the correct value" do
      expect(order.total).to eq order_total
    end
  end

  describe "#checkout" do
    let(:checkout)       { double "a checkout" }
    let(:checkout_class) { double "a checkout class", new: checkout }
    let(:order_total)    { "£31.49" }
    context "using a double of an order to test sms" do
      it "instantiates checkout_class object" do
        allow(order).to receive(:total).and_return(order_total)
        expect(checkout_class).to receive(:new).with(order_total.delete("£").to_f)
        order.checkout(checkout_class)
      end
    end
  end
end
