require 'takeaway'

describe TakeAway do
  let(:menu_klass) { class_double "Menu", new: menu }
  let(:menu) {double :menu, format_list: dishlist}

  let(:order_klass) { class_double "Order", new: order }
  let(:order) {double :order}

  let(:dishlist) { [{:dish=>:v, :price=>4},
                    {:dish=>:v, :price=>3}] }

  let(:sms) {Class.new}

  subject(:take_away) { described_class.new(menu_klass, order_klass, sms) }

  describe "#initialize" do
    it "creates a menu" do
      expect(take_away.menu).to be(menu)
    end

    it "has an empty orders array on initialization" do
      expect(take_away.orders).to eq ([])
    end
  end

  describe "#show_menu" do
    it "prints a menu of dishes and prices" do
      allow(take_away.menu).to receive(:format_list).and_return(dishlist)
      expect{take_away.show_menu}.to output("#{dishlist}").to_stdout
    end
  end

  describe "#create_order" do
    it "creates a new order" do
      expect(take_away.create_order).to be(order)
    end
  end
  context "order was created already" do
    before do
      take_away.create_order
    end

    it "lets user add items to order" do
      allow(take_away.order).to receive(:add).and_return(dishlist)
      expect(take_away.add(1, 2)).to be(dishlist)
    end

    it "shows order to the user" do
      allow(take_away.order).to receive(:format_order).and_return(dishlist)
      expect { take_away.show_order }.to output("#{dishlist}").to_stdout
    end

    it "lets user remove unwanted items" do
      allow(take_away.order).to receive(:remove_items).and_return(dishlist)
      expect(take_away.remove_items(1)).to be(dishlist)
    end

    it "lets user check if total sum correct" do
      allow(take_away.order).to receive(:correct?).and_return(true)
      expect(take_away.order_correct?).to eq true
    end


    describe "#place" do
      context "order has items in it" do
        before do
          allow(take_away.order).to receive(:empty?).and_return(false)
          allow(take_away.sms).to receive(:send_text).and_return(dishlist)
        end

        it "lets user place order" do
          take_away.place_order
          expect(take_away.orders).to include(order)
        end

        it "calculates delivery time" do
          take_away.place_order
          expect(take_away.delivery_time).to eq (Time.now + 3600).strftime("%H:%M")
        end

        it "sends a confirmation message" do
          expect(take_away.place_order).to eq dishlist
        end
      end
      context "order is empty" do
        it "raises error if user tries to place empty order" do
          message = "Cannot place an empty order!"
          allow(take_away.order).to receive(:empty?).and_return(true)
          expect {take_away.place_order}.to raise_error(NoItemError, message)
        end
      end
    end
  end
end
