require "takeaway"

describe Takeaway do

  subject(:takeaway)  { described_class.new(menu: menu, order: order) }

  let(:menu)          { double(:menu, show: shows_menu) }
  let(:order)         { double(:order) }
  let(:shows_menu)    { "The menu is..." }
  let(:dishes)        { { Chicken_Tikka: 1, Rice: 1, Naan_Bread: 1 } }


  xit "shows a list of dishes with prices" do
    expect(takeaway.show_menu).to eq shows_menu
  end

  xit "can order a number of available dishes" do
   total = "Total is £7.50"
   expect(takeway.create_order(dishes)).to eq total
 end
end