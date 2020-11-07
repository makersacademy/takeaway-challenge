require 'order'

describe Order do

  it "created an instance of Order" do
    expect(subject).to be_an_instance_of Order
  end

  it "initialized order has a #total of 0 by default" do
    expect(subject.total).to eq 0
  end

  it "initialized oder has an empty #selected_items array" do
    expect(subject.selected_items).to be_empty
  end

  describe "#see_menu" do
    it "displays a menu" do
      expect { subject.see_menu }.to output.to_stdout
    end
  end

  describe "#select()" do
    it "responds to #select with the dish as an argument" do
      expect(subject).to respond_to(:select).with(1).argument
    end
    it "stores the selection in the selected_items array" do
      expect{ subject.select("Burger") }.to change{ subject.selected_items.count }.by 1
    end
  end

  describe "#view_order" do
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
