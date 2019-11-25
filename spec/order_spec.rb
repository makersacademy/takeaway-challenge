require 'order'

describe Order do
 
  let(:menu) { double :menu }
  # let(:order_class) { double(:order_class, new: menu)}
  subject { described_class.new(menu) }

  describe '#show_menu' do
    it "should print the menu out to the STDOUT" do
      allow(menu).to receive(:view) { puts "1.  Sweet & Sour Chicken Balls    5.99\n" }
      expect { subject.show_menu }.to output("1.  Sweet & Sour Chicken Balls    5.99\n").to_stdout
    end
  end

  describe "#add_to_basket" do
    before do
      allow(menu).to receive(:select_item).with(1) { { :dish => "Sweet & Sour Chicken Balls", :unit_price => 5.99, :id => 1 } }
    end

    context "if the item is not already in the basket" do
      it "should add an item to the basket list with a default quantity of 1" do
        subject.add_to_basket(1)
        expect(subject.basket).to include([{ :dish => "Sweet & Sour Chicken Balls", :unit_price => 5.99, :id => 1 }, 1])
      end

      it "should add an item to the basket list with a quantity of 2 if the second argument is 2" do
        subject.add_to_basket(1, 2)
        expect(subject.basket).to include([{ :dish => "Sweet & Sour Chicken Balls", :unit_price => 5.99, :id => 1 }, 2])
      end
      
    end

    context "if the item is already in the basket" do
      it "should increment the quantity by the given amount" do
        subject.add_to_basket(1)
        subject.add_to_basket(1, 2)
        expect(subject.basket).to include([{ :dish => "Sweet & Sour Chicken Balls", :unit_price => 5.99, :id => 1 }, 3])
      end
    end

    xit "should raise an error if an integer outside the menu range is given" do
      # need to add this functionality in the code
    end

    xit "should raise an error if an input other than an integer is given" do
      # need to add this functionality in the code
    end

  end

  describe "#summary" do
    
    it "should print the order summary, with total to the STOUT" do
      # ??
    end
     
  end

  describe "#total" do

    before do
      allow(menu).to receive(:select_item).with(1) { { :dish => "Sweet & Sour Chicken Balls", :unit_price => 5.99, :id => 1 } }
      allow(menu).to receive(:select_item).with(2) { { :dish => "Crispy Duck Spring Rolls (4)", :unit_price => 4.99, :id => 2 } }
    end

    it "should return the correct total amount in the basket with 1 item" do
      subject.add_to_basket(1)      
      expect(subject.total).to eq(5.99)
    end

    it "should return the correct total amount in the basket with 1 item" do
      subject.add_to_basket(1)
      subject.add_to_basket(2, 2)         
      expect(subject.total).to eq(15.97)
    end
  end
end
   