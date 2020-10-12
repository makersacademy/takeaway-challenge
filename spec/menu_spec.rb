require 'menu'

describe TakeawayMenu do
  it "returns a menu with dishes and prices" do
    expect(subject.menu).to eq "Lasagne" => 12, "Sausage and Mash" => 11.50, "Lamb Saag" => 9.00, "Beef Wellington" => 18.00
  end

  context '#enter_order' do

    it ' allows the user to order using meal names' do
      order = TakeawayMenu.new
      allow(order).to receive(:gets).and_return("Lasagne")
      expect(order.select_meals).to eq(["Lasagne"])
    end

    it "allows the user to order using meal names" do
      order = TakeawayMenu.new
      allow(order).to receive(:gets).and_return("Lamb Saag")
      expect(order.select_meals).to eq(["Lamb Saag"])
    end

  end

  # RSpec.describe @chosen_meals do
  #   it { is_expected.to include("Lamb Saag") }
  # end

end
