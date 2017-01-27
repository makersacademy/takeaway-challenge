require 'takeaway'


describe "Takeaway" do

subject(:takeaway) { Takeaway.new(menu, order) }
let(:menu) { double :menu, print_menu: nil }
let(:dish) { double :dish }
let(:quantity) { double :quantity }
let(:order) { double :order, add: nil }
let(:summary) { "Chicken x#{quantity} = £11.00" }
let(:calc_total) { 1100 }
let(:total) { double :total }
let(:money_format) { double :money_format }

  describe "#creation" do

    it "should set order complete status to false" do
      expect(subject.completed).to be false
    end
  end

  describe "#get_menu" do
    it "should print a menu" do
      subject.get_menu
      expect(menu).to have_received(:print_menu)
    end
  end

  describe "#place_order" do

    context "when order is not complete" do

      it "should place an order" do
        allow(subject).to receive(:completed?).and_return(false)
        subject.place_order(dish, quantity)
        expect(order).to have_received(:add).with(dish, quantity)
      end
    end
  end

  describe "#basket_summary" do

    it "should print out a summary of the basket" do
      allow(order).to receive(:basket).and_return([["Chicken",quantity,1100]])
      takeaway.place_order("Chicken",quantity)
      expect(takeaway.basket_summary).to eq summary
    end
  end


  describe "#calc_total" do

    it "should calculate the total amount payable for an order" do
      allow(order).to receive(:basket) { [[dish, quantity, 1000], [dish, quantity, 1000]] }
      expect(takeaway.calc_total).to eq 2000
    end
  end

  describe "#money_format" do

    it "should format the amounts in GBP" do
      allow(takeaway).to receive(:money_format).with(1100)
      expect(takeaway).to receive(:money_format).with(1100)
      takeaway.money_format(1100)
    end
  end

  describe "#checkout" do
    it "should return the total amount payable" do
      allow(takeaway).to receive(:calc_total).and_return(:non_formatted_amount)
      allow(takeaway).to receive(:money_format).with(:non_formatted_amount).and_return(total)
      allow(takeaway).to receive(:send_text).and_return(nil)
      takeaway.place_order("Chicken",2)
      expect(takeaway.checkout).to eq "Total: #{total}"
    end
  end

  describe "#send_text" do
    it 'sends a payment confirmation text message' do
      allow(takeaway).to receive(:send_text)
      expect(takeaway).to receive(:send_text)
      takeaway.send_text
    end
  end
end
