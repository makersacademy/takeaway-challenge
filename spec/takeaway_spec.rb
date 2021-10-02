require "takeaway"

describe Takeaway do
  let(:chow_mein) { double("chow_mein", :price => 4.50) }
  let(:fried_rice) { double("fried_rice", :price => 3.50) }
  let(:ribs) { double("ribs", :price => 4.00)}
  let(:menu) { double("menu", :menu_items => [chow_mein, fried_rice, ribs])}

  before do
    allow(menu).to receive(:menu_items).and_return([chow_mein, fried_rice, ribs])
    allow(chow_mein).to receive(:name).and_return("chow_mein")
    allow(fried_rice).to receive(:name).and_return("fried_rice")
    allow(ribs).to receive(:name).and_return("ribs")
  end

  it "should show a list of dishes with prices" do
    output = menu.menu_items.each { |dish|  "#{dish.name}, £#{dish.price}" }
    expect(subject.see_menu(menu)).to eq(output)
  end

  it "should be able to add an item to an oder" do
    expect { subject.add_to_order(chow_mein) }.to change { subject.order.items }.to([chow_mein])
  end
end