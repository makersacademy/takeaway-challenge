require "takeaway"

describe Takeaway do

  let(:takeaway) { described_class.new }

  context "#initialize" do
    it "initializes with a menu object" do
      expect(takeaway.menu).to be_an_instance_of Menu
    end

    it "initializes with an order object" do
      expect(takeaway.order).to be_an_instance_of Order
    end

    it "initializes with a message object" do
      expect(takeaway.message).to be_an_instance_of Message
    end
  end

  context "#show_menu" do
    it "prints the menu" do
      allow(takeaway).to receive(:show_menu).and_return({ "Hui Guo Rou" => 4.25 })
      expect(takeaway.show_menu).to eq({ "Hui Guo Rou" => 4.25 })
    end
  end

  context "#show_total" do
    it "prints the total price" do
      expect { takeaway.show_total }.to output.to_stdout
    end
  end

end
