require 'takeaway'
require 'order'
require 'menu'
require 'messager'

describe Takeaway do
  let('menu') { double :menu, on_the_menu?: true }
  let('order') { double :order, add: true }
  let('messager') { double :messager, send_text: true }
  before do
    allow(Order).to receive(:new) { order }
    allow(Menu).to receive(:new) { menu }
    allow(Messager).to receive(:new) { messager }
  end
  subject { described_class.new(menu) }
  it 'uploads a hash to menu instance' do
    expect(menu).to receive(:upload).with({ "pizza" => 1.00 })
    subject.upload_menu({ "pizza" => 1.00 })
  end

  it 'passes read method to menu instance' do
    expect(menu).to receive(:read)
    subject.read_menu
  end

  it 'prints returned menu' do
    allow(menu).to receive(:read) { { "pizza" => 1.99 } }
    expect { subject.read_menu }.to output("{\"pizza\"=>1.99}\n").to_stdout
  end

  it 'adds 1 item as default' do
    expect { subject.order("pizza") }. to output("1x pizza(s) added to order\n").to_stdout
  end

  it 'prints confirmation for added products' do
    expect { subject.order("pizza", 2) }. to output("2x pizza(s) added to order\n").to_stdout
  end

  it 'prints rejection for not present products' do
    allow(menu).to receive(:on_the_menu?) { false }
    expect { subject.order("sausage", 2) }.to output("Sorry, no sausage available\n").to_stdout
  end

  it 'puts order summary' do
    allow(order).to receive(:summary) { [{ :item => "pizza", :quant => 2, :total => 4.96 }] }
    expect { subject.order_summary }.to output("2x pizza = £4.96\n").to_stdout
  end

  it 'puts order total' do
    allow(order).to receive(:total).with(menu) { 14 }
    expect { subject.order_total }.to output("The total bill is £14\n").to_stdout
  end

  it 'checks amount paid is correct' do
    allow(order).to receive(:total).with(menu) { 14 }
    expect(subject.paid_bill?(14)).to eq true
  end

  it 'raises error if amount paid is incorrect' do
    allow(order).to receive(:total).with(menu) { 14 }
    expect { subject.complete_order(12) }.to raise_error("Wrong amount paid")
  end

  it 'sends payment to order instance' do
    allow(order).to receive(:total).with(menu) { 14 }
    expect(messager).to receive(:send_text)
    subject.complete_order(14)
  end

end
