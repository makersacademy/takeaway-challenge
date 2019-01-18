require 'takeaway'

describe Takeaway do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  describe "read_menu" do
    it "shows a list of dishes with prices" do
      dishes = Menu.new
      expect(subject.read_menu).to eq(dishes.load_menu)
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  
end
