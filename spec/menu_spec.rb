# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require 'menu'

describe Menu do
subject(:menu) {described_class.new}

  it "stores the items on the menu, and their prices" do
    expect(menu.list_items).to eq ({"pizza" => 5, "soup" => 2})
  end

end
