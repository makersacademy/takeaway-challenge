require 'order'

describe Order do

  subject(:order)      { described_class.new }
  let(:menu)           { order.menu }
  let(:selection)      { double "a hash of selections" }
  let(:provided_total) { double "the total provided" }
  let!(:correct_item)  { menu.keys.sample }
  let!(:correct_item2) { menu.reject { |key| key == correct_item }.keys.sample }
  let(:incorrect_item) { double("an incorrect item", to_sym: :"incorrect item") }
  let(:quantity)       { 3 }

  it "initializes with a menu hash" do
    expect(order.menu).to be_instance_of Hash
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
          "= £#{quantity * order.menu[correct_item.to_sym]}"
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
        "= £#{order.selection[correct_item] * order.menu[correct_item.to_sym]}, "\
        "#{order.selection[correct_item2]} x #{correct_item2} "\
        "= £#{order.selection[correct_item2] * order.menu[correct_item2.to_sym]}"
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
    let(:order_total) {
      order.selection.map { |item, amount| amount * menu[item] }.inject(&:+)
    }
    let(:incorrect_order_total) { order_total - 1 }
    let(:checkout) { double "a checkout" }
    let(:checkout_class) { double "a checkout class", new: checkout }
    let(:phone_number) { double "a phone number" }
    before :each do
      20.times { |num| order.add(menu.keys.sample, num) }
    end

    context "when provided_total is incorrect" do
      it "raises 'Incorrect total provided' error" do
        error_msg = "Incorrect total provided"
        expect { order.checkout(incorrect_order_total, checkout_class, phone_number) }.to raise_error error_msg
      end
    end

    context "when provided_total is correct" do
      context "using an example order to test error" do
        it "does not raise error" do
          expect { order.checkout(order_total, phone_number, checkout_class) }.not_to raise_error
        end
      end

      context "using a double of an order to test sms" do
        before :each do
          allow(order).to receive(:validate).and_return nil
        end

        it "instantiates checkout_class object" do
          expect(checkout_class).to receive(:new).with(order_total, phone_number)
          order.checkout(order_total, phone_number, checkout_class)
        end
      end
    end
  end
end
