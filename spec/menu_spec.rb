require 'menu'

describe TakeawayMenu do
  it "returns a menu with dishes and prices" do
    expect(subject.menu).to eq "Lasagne" => 12, "Sausage and Mash" => 11.50, "Lamb Saag" => 9.00, "Beef Wellington" => 18.00
  end

  context '#enter_order' do

    it ' allows the user to order using meal names' do
      order = TakeawayMenu.new
      allow(order).to receive(:gets).and_return("Lasagne")
      order.select_meals
      expect(order.select_meals).to eq("Lasagne")
    end

  end

end

# Place the order by giving the list of dishes, their quantities and a number that should be the exact total
