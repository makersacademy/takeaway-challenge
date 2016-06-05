require 'takeaway'

describe Takeaway do
    
  subject(:takeaway) { described_class.new }
  let(:meal1) { 1 }
  let(:meal2) { 2 }
  let(:user_input) { double (user_input) }

  describe "#view_menu" do
    it "prints out the menu on request" do
    expect(takeaway.view_menu).to eq MENU
    end

  end

  describe "#select_food" do

    it "responds to #select_food" do
        expect(takeaway).to respond_to(:select_food)
    end

    it "returns the menu selection on input" do
        expect(takeaway).to receive(:gets).and_return(meal1)
        expect(takeaway.select_food).to eq MENU[1]
    end
  end
  
  describe "#view_order" do

    it "returns a total of the food inside the basket" do
        expect(takeaway).to receive(:gets).and_return(meal1)
        takeaway.select_food
        expect(takeaway).to receive(:gets).and_return(meal2)
        takeaway.select_food
        expect(takeaway.view_order).to eq 17.5
    end
  end
end
