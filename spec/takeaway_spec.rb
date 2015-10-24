require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu_klass.new, order_klass.new) }

  let(:menu) { double(:menu, dishes: {"Spring Roll" => 0.99, "Fried Prawn" => 2.99}) }
  let(:menu_klass) { double(:menu_klass, new: menu) }

  let(:order) { double(:order) }
  let(:order_klass) { double(:order_klass, new: order) }

  let(:itm) { 'Spring Roll' }
  let(:qty) { 2 }

  context "#initialize" do

    it "creates a new #Menu instance" do
      expect(takeaway).to have_attributes(:menu => menu)
    end

    it "creates a new #Order instance" do
      expect(takeaway).to have_attributes(:order => order)
    end
  end

  context "#read_menu" do

    it "displays the menu" do
      allow(menu).to receive(:read) { menu.dishes }
      expect(takeaway.read_menu).to eq menu.dishes
    end
  end

  context "#add" do

    it "reports items being added to #basket" do
      allow(order).to receive(:add_to_basket)
      expect(takeaway.add(itm, qty)).to eq "#{qty}x #{itm}(s) added to your basket."
    end
  end

  # context "#basket_summary" do
  #
  #   it "reports a summary of the basket" do
  #     expect(takeaway.basket_summary).to eq ""
  #   end
  #
  # end

  context "#total_cost" do

    it "reports the total cost" do
      allow(order).to receive(:total_bill).with(menu) { 1.98 }
      expect(takeaway.total_cost).to eq "Total Cost: £#{(menu.dishes[itm]*qty).round(2)}"
    end
  end

  context "#checkout" do

    it "raises error if final cost given does not match sum of basket" do
      allow(order).to receive(:total_bill).with(menu) { 1.98 }
      takeaway.total_cost
      expect{takeaway.checkout(1.50)}.to raise_error described_class::CHECKOUT_ERROR
    end

  end



end
