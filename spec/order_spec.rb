require "order"
#require "menu" Not required after stub

describe Order do

#let(:menu) {Menu.new} Not required after stub
let(:menu) { double :menu }
let(:number) { double :number }

  it "should respond to add item" do
    expect(subject).to respond_to(:add_item)
  end

  it "should respond to a menu item request with an array" do
    allow(menu).to receive(:menu_item).with(number).and_return(Array)
    expect(subject.add_item(number, menu)).to be_a(Array)
  end

  it "should show the items that are in the order" do
    expect(subject.order).to be_a(Array)
  end

end
