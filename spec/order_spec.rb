require "order"

describe Order do

  let(:menu) { double :menu }

  it "should return an array of an hash with the select dish and its price" do
    menu = Menu.new
    test = Order.new(menu)
    subject.stub(:gets).and_return('1', '1', 'n')
  end
end
