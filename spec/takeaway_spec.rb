require 'takeaway'

describe Takeaway do

subject(:takeaway) {Takeaway.new(mnu_klass.new,ord_klass.new,txtmsg_klass.new)}

  let(:menu) {double(:menu, dishes: { 'Spring Roll' => 0.99, 'Prawn' => 2.99 })}
  let(:mnu_klass) { double(:mnu_klass, new: menu) }

  let(:order) { double(:order) }
  let(:ord_klass) { double(:ord_klass, new: order) }

  let(:messenger) { double(:messenger) }
  let(:txtmsg_klass) { double(:txtmsg_klass, new: messenger) }

  let(:itm) { 'Spring Roll' }
  let(:qty) { 2 }
  let(:total) { 1.98 }

  let(:item_error) { described_class::ITEM_ERROR }
  let(:checkout_error) { described_class::CHECKOUT_ERROR }


  context "#initialize" do

    it "creates a new #Menu instance" do
      expect(takeaway).to have_attributes(menu: menu)
    end

    it "creates a new #Order instance" do
      expect(takeaway).to have_attributes(order: order)
    end

    it "creates a new #TextMessenger instance" do
      expect(takeaway).to have_attributes(messenger: messenger)
    end
  end

  context "#read_menu" do

    it "displays the menu" do
      allow(menu).to receive(:read) { menu.dishes }
      expect(takeaway.read_menu).to eq menu.dishes
    end
  end

  context "#place_order" do

    it "raises error if item does not exist" do
      expect{takeaway.place_order('Crackers')}.to raise_error item_error
    end

    it "reports items being added to #basket" do
      allow(order).to receive(:add_to_basket)
      message = "#{qty}x #{itm}(s) added to your basket."
      expect(takeaway.place_order(itm, qty)).to eq message
    end
  end

  context "#basket_summary" do

    it "triggers summary of basket" do
      allow(order).to receive(:basket_sum)
      expect(order).to receive(:basket_sum).with(menu)
      takeaway.basket_summary
    end

  end

  context "#total_cost" do

    it "reports the total cost" do
      allow(order).to receive(:total_bill).with(menu) { total }
      allow(order).to receive(:basket) { {itm => qty} }
      message = "Total Cost: £#{(menu.dishes[itm]*qty).round(2)}"
      expect(takeaway.total_cost).to eq message
    end
  end

  context "#checkout" do

  before do
    allow(order).to receive(:total_bill).with(menu) { total }
    allow(order).to receive(:basket) { {itm => qty} }
    takeaway.total_cost
  end

    it "raises error if final cost given does not match sum of basket" do
      expect{takeaway.checkout(1.50)}.to raise_error checkout_error
    end

    it "otherwise sends a text message" do
      expect(takeaway).to receive(:send_msg)
      takeaway.checkout(total)
    end

    it "#messenger receives #send_text method" do
      allow(messenger).to receive(:send_text)
      expect(messenger).to receive(:send_text)
      takeaway.checkout(total)
    end
  end
end
