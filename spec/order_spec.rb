require "order"

describe Order do 

subject(:order) { described_class.new }
let(:menu) { double(:menu) }

  it "shows the menu with dishes and prices" do
    allow(menu).to receive(:menu_list) {[nil, nil, nil, nil]}
  end 
end 