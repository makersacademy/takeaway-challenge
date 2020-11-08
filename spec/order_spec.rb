require 'order'

describe Order do

let(:menu) { double('Menu.new') }

  it "created an instance of Order" do
    expect(subject).to be_an_instance_of Order
  end

  it "initialized order has an empty #selected_items array" do
    expect(subject.selected_items).to be_empty
  end

  it "initialized order has a new instance of the Menu class" do
    expect(subject.menu).to be_an_instance_of Menu
  end

   describe "#see_menu" do
    it "displays a menu" do
    allow(menu).to receive(:view_menu)
    expect { subject.see_menu }.to output.to_stdout
    end
   end

   describe "#select()" do
      it "expects order to respond to select method" do
       expect(subject).to respond_to(:select).with(2).arguments
      end
      it "adds the dish to the order without raising an error" do
        expect { subject.select("Burger", 2) }.not_to raise_error
      end
      it "raises an error if the dish added is not on the menu or spelt wrong" do
        expect { subject.select("burger", 4) }.to raise_error "Error - don't think we have that. Have you checked your spelling?"
      end
      it "stores the selection in the selected_items array" do
        expect{ subject.select("Burger", 2) }.to change { subject.selected_items.count }.by 2
      end
    end

    describe "#total" do
      it "returns the total price of the dishes added" do
        subject.select("Burger", 2)
        expect(subject.total).to eq 2 * 5
      end
    end

  end
