require 'takeaway'

describe Takeaway do
  let(:menu_double) { double :menu }
  let(:order_double) { double :order }
  subject(:takeaway) { Takeaway.new(menu_double, order_double) }


  let (:get_price_for_double) { allow(menu_double).to receive(:get_price_for) {7.90} }
  let(:menu_item_exists) { allow(menu_double).to receive(:not_on_menu?) { false } }
  let(:order_double_format) { allow(order_double).to receive(:format_order) { "Large Fish Supper x2\n"} }


  describe '#see_menu' do
    it 'puts a formatted list of menu items to the customer' do
      dish = "Large Fish Supper - £7.90"
      allow(menu_double).to receive(:get_menu) { [dish] }
      expect { takeaway.see_menu }.to output("#{dish}\n").to_stdout
    end
  end

  describe '#select(dish,quantity)' do
    it 'puts message if dish does not exist' do
      allow(menu_double).to receive(:not_on_menu?) { true }
      message = "I'm sorry, we don't have that on our menu."
      expect(takeaway.select("Large Fssssh Supper",2)).to eq(message)
    end
    it 'returns "Dish added!"' do
      menu_item_exists
      get_price_for_double
      allow(order_double).to receive(:add_selection) { "Dish added!" }
      expect(takeaway.select("Large Fish Supper",2)).to eq "Dish added!"
    end
  end

  describe '#see_order' do
    it 'allows the customer to see order and total' do
      allow(order_double).to receive(:get_order) { ["Large Fish Supper x2"] }
      allow(order_double).to receive(:get_total) { "Total: £15.80" }
      expect { takeaway.see_order }.to output("Large Fish Supper x2\n").to_stdout
    end
  end

  describe '#confirm_order(amount)' do
    it 'raises an error if the customer total does not match the total' do
      allow(order_double). to receive(:total) { 15.8 }
      expect { takeaway.confirm_order(15.9) }.to raise_error("That isn't the right amount.")
    end

    it 'return "Order confirmed!" if customer total matches total' do
      allow(order_double). to receive(:total) { 15.8 }
      expect(takeaway.confirm_order(15.8)).to eq("Order confirmed!")
    end
  end
end
