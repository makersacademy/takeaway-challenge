require "order"

describe Order do

  context "order list functionalities" do

    it "starts with empty array" do
      expect(subject.order).to eq []
    end

    it "adds dish to the order" do
      expect { subject.add("Burger" => 2) }.to change { subject.order.count }.by(1)
    end
  end

  context "total functionalities" do
    it "starts with a total equal to 0" do
      expect(subject).to have_attributes(:total => 0)
    end

    it "increases total by dish price" do
      expect { subject.add({ "Burger" => 2 }) }.to change { subject.total }.by(2)
    end

    it "shows current order & total" do
      subject.add({ "Burger" => 2 }) 
      expect { subject.show_order }.to output("Burger £2\nTOTAL = £2\n").to_stdout
    end
  end
end
