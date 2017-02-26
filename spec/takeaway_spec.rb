require 'takeaway'
require 'stringio'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, check_menu: "Burger", price: 7.0, dishes: {"Burger" => 7.0} }
  let(:item) { double :dish }

describe '#view_menu' do
  it 'returns the menu' do
    expect(takeaway.view_menu).to eq({"Burger" => 7})
  end
end

describe '#add_to_order' do
  it 'adds a menu item to the order' do
    takeaway.add_to_order(item)
    expect(takeaway.basket).to include item
  end
  it 'adds multiple items to the order' do
    takeaway.add_to_order(item, 4)
    expect(takeaway.basket).to include item
  end
  it 'collects items of the same type' do
    2.times {takeaway.add_to_order(item)}
    expect(takeaway.basket).to eq({ item => 2 })
  end
end

describe '#review_order' do
  before do
    $stdout = StringIO.new
  end
  after(:all) do
    $stdout = STDOUT
  end
  it 'should print out order and subtotals' do
    takeaway.add_to_order("Burger", 2)
    takeaway.review_order
    expect($stdout.string).to match("Burger x 2: £14.0\nTotal: £14.0")
  end
end

describe '#checkout' do

  let(:sms) { double :method, send_msg: "Message sent" }

  it 'raises error if payment does not match total' do
    takeaway.add_to_order("Burger", 4)
    msg = "Please enter correct payment amount"
    expect{takeaway.checkout(4,sms)}.to raise_error msg
  end
  it 'does not raise error if payment matches total' do
    takeaway.add_to_order("Burger")
    expect{takeaway.checkout(7.0, sms)}.not_to raise_error
  end
end


end
