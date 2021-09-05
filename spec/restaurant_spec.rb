require "restaurant"

describe Restaurant do

  it { is_expected.to be_instance_of Restaurant }

  it { is_expected.to respond_to (:show_menu) }

  it { is_expected.to respond_to(:add_dish).with(1).argument }

  it { is_expected.to respond_to(:order_summary) }

  it "shows the menu" do
    menu = "Chicken Souvlaki Wrap - £8\nHaloumi Souvlaki Wrap - £7\nFalafel Souvlaki Wrap - £7\nChips - £4\nWater - £1\nCoke - £2\n"
    expect { subject.show_menu }.to output(menu).to_stdout
  end

  context "#add_dish" do

    it "adds a dish to the basket" do
      subject.add_dish("Water")
      expect(subject.basket).to eq("Water" => 1)
    end

    it "adds several dishes to the basket" do
      subject.add_dish("Water")
      subject.add_dish("Coke")
      subject.add_dish("Water", 3)
      expect(subject.basket).to eq("Water" => 4, "Coke" => 1)
    end
  end

  context "#order_summary" do

    it "shows the basket" do
      subject.add_dish("Water")
      subject.add_dish("Coke")
      subject.add_dish("Water", 3)
      basket = "4X Water = £4\n1X Coke = £2\nTotal: £6\n"
      expect { subject.order_summary }.to output(basket).to_stdout 
    end
  end
end
