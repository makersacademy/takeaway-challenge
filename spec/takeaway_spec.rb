require 'takeaway'

describe Takeaway do
  let(:menu_double) { double :menu, print_menu: "Quiche - £3", find_price: 3 }
  let(:customer_double) { double :customer, input_number: true, send_confirmation: true }
  let(:menu_class_double) { double :menu_class, new: menu_double }
  let(:cust_class_double) { double :cust_class, new: customer_double }

  before :each do
    @new_order = Takeaway.new(menu_class_double, cust_class_double)
  end

  describe '#initialize' do
    it 'creates a new menu' do 
      expect(menu_class_double).to receive(:new)
      Takeaway.new(menu_class_double)
    end

    it 'creates a new customer profile' do 
      expect(cust_class_double).to receive(:new)
      Takeaway.new(menu_class_double, cust_class_double)
    end

    it 'creates an empty order' do
      expect(@new_order.order).to be_empty
    end
  end

  describe '#see_dishes' do
    it 'prints the menu' do
      expect(@new_order.see_dishes).to eq "Quiche - £3"
    end
  end

  describe '#place_order' do
    before :each do
      allow(@new_order).to receive(:gets).and_return("Quiche", "2", "N")
    end
    it 'asks for an item & quantity' do 
      expect { @new_order.place_order }.to output("What would you like to order?\nInput Quantity:\nAnything else? Y or N\n").to_stdout
    end
    it 'allows user input' do 
      expect(@new_order).to receive(:gets)
      @new_order.place_order
    end

    context "More than one item" do
      before :each do
        allow(@new_order).to receive(:gets).and_return("Quiche", "2", "Y", "Chocolate", "1", "N")
      end

      it 'adds multiple items to an order' do 
        @new_order.place_order
        expect { @new_order.print_order }.to output("Quiche(2) ~ £3\nChocolate(1) ~ £3\nTOTAL: £9\n").to_stdout
      end
    end
  end

  describe '#verify_order' do
    context 'order is correct' do
      before :each do
        allow(@new_order).to receive(:gets).and_return("Quiche", "2", "N", "Y")
        @new_order.place_order
      end
      it 'prints the order' do 
        expect(@new_order).to receive(:print_order)
        @new_order.verify_order
      end
      it 'asks if the order is correct' do
        expect { @new_order.verify_order }.to output("Quiche(2) ~ £3\nTOTAL: £6\nIs everything correct? Y or N\n").to_stdout
      end
      it 'texts confirmation message' do
        expect(@new_order).to receive(:text_confirmation)
        @new_order.verify_order
      end
    end

    context 'order is incorrect' do
      before do
        @wrong_order = Takeaway.new(menu_class_double, cust_class_double)
        allow(@wrong_order).to receive(:gets).and_return("N")
      end
      it "resets the order" do
        expect(@wrong_order.verify_order).to eq "Your order has been reset"
        expect(@wrong_order.order).to be_empty
      end
    end

    describe '#text_confirmation' do
    end
  end
end
