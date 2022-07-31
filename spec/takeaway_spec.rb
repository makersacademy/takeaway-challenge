require "takeaway"
require "stringio"

describe Takeaway do
  let(:chow_mein) { double("chow_mein", :price => 4.50) }
  let(:fried_rice) { double("fried_rice", :price => 3.50) }
  let(:ribs) { double("ribs", :price => 4.00) }
  let(:menu) { double("menu", :items => [chow_mein, fried_rice, ribs]) }

  subject { described_class.new(menu) }

  before do
    allow(menu).to receive(:items).and_return([chow_mein, fried_rice, ribs])
    allow(chow_mein).to receive(:name).and_return("chow_mein")
    allow(fried_rice).to receive(:name).and_return("fried_rice")
    allow(ribs).to receive(:name).and_return("ribs")
    allow(chow_mein).to receive(:price).and_return(3.5)
    allow(fried_rice).to receive(:price).and_return(4)
    allow(ribs).to receive(:price).and_return(7)
  end

  it "should show a list of dishes with prices" do
    output = menu.items.each { |dish| "#{dish.name}, £#{dish.price}" }
    expect(subject.see_menu).to eq(output)
  end

  it "should be able to add an item to an order" do
    expect { subject.add_to_order("2") }.to output("#{fried_rice.name} added to the order\n").to_stdout.and change { subject.order.items }.to([fried_rice])
  end

  
end
