require "order"

describe Order do

  let(:menu) { double :menu }

  it "should return an array of an hash with the select dish and its price" do
    menu = Menu.new
    test = Order.new(menu)
    allow($stdin).to receive(:gets).and_return('1', '1', 'n')
    allow(gets).to receive(:chomp).and_return('1', '1', 'n')
    expect(test.choose).to eq({ Pizza: 8 })
  end
end
