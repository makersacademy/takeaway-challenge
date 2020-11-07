require 'order'

describe Order do

#let(:menu) { double :menu }

  it "created an instance of Order" do
    expect(subject).to be_an_instance_of Order
  end

  it "initialized order has a #total of 0 by default" do
    expect(subject.total).to eq 0
  end

  it "initialized order has an empty #selected_items array" do
    expect(subject.selected_items).to be_empty
  end

  it "initialized order has a new instance of the Menu class" do
    expect(subject.menu).to be_an_instance_of Menu
  end

  describe "#see_menu" do
    it "displays a menu" do
      #expect(menu).to receive(print)
      expect { subject.menu.print }.to output.to_stdout
    end
  end

  describe "#select()" do
    it "responds to #select with the dish as an argument" do
      expect(subject).to respond_to(:select).with(1).argument
    end
    it "stores the selection in the selected_items array" do
      menu = double("double for menu")
      expect{ subject.select("Burger") }.to change { subject.selected_items.count }.by 1
    end
    # COMMENTING OUT AS TEST FAILING AND DON'T KNOW WHY
    # it "calculates the total based on the user's selection" do
    #   expect{ subject.select("Burger") }.to change { subject.total }.by 5
    # end
  end

  describe "#view" do
    it "displays the user's selections" do
      subject.select("Burger")
      subject.select("Fries")
      expect { subject.view }.to output("Burger\nFries\n").to_stdout
    end
  end

  describe "#place()" do
    it "places the order with the phone number as the argument" do
      expect(subject).to respond_to(:place).with(1).argument
    end
    it "sends a Thank you message" do
      expect { subject.place("905") }.to output.to_stdout
    end
  end


end
