require "restaurant"

 describe Restaurant do
   let(:order) { described_class.new }
   let(:menu) { double :menu }
 
  it { expect(subject).to respond_to :show_menu }

  it { expect(subject).to respond_to :add_order }

  it { expect(subject).to respond_to :order_price }

  it { expect(subject).to respond_to :basket_summary }

  it { expect(subject).to respond_to :cost_of_each }

  it { expect(subject).to respond_to :total }

  it { expect(subject).to respond_to :remove_dish }

  it { expect(subject).to respond_to :edit_order }
 
   it "should print the menu" do
     expect(subject.show_menu).to eq Menu::MENU
   end
 
   it "should have let a customer add an order" do
     expect(subject.add_order("Dodo egg")).to eq "You have ordered 1 Dodo egg(s) at a price of $7.99}"
   end

   it "allows the customer to order multiples of a dish" do
     expect(subject.add_order("dodo egg", 5)).to eq "You have ordered 4 Dodo egg(s) at a price of $39.95}"
   end

   it "should allow you to see the price of an item" do
    expect(subject.order_price("dodo egg", 2)).to eq 23.97
 
   it "should add the order to the order list" do
     subject.add_order("dodo egg")
     expect(subject.basket_summary.length).to eq 1
   end
 
    it "should keep a record of the dishes" do 
      subject.add_order("rex steak", 3)
      subject.add_order("dodo egg", 2)
     expect(subject.basket_summary.length).to eq 2
    end
 
     it "should let you remove a selection" do
       expect { subject.remove_selection("rex steak") }.to change { subject.order_list.length }.by -1
    end
 
     it "should show the order total" do
       expect(subject.total).to eq "$24.95"
     end
 end