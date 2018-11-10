require "order"

describe Order do

  before do
    allow($stdout).to receive(:write)
  end

  describe "#order_number" do
    it "gives a random order number between 4563 and 4985" do
      expect(subject.order_number).to be_between(4563,4985)
    end
  end

  describe "#order_selection" do
    it "allows the user to make their selection" do
      expect_any_instance_of(Order).to receive(:gets) { "1 Garlic Bread, 1 Margherita, order total: 13" }
      expect(subject.order_selection).to eq("1 Garlic Bread, 1 Margherita, order total: 13")



      # expect(subject).to


    end
  end




end
