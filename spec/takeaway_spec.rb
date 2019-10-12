require 'takeaway'

describe Takeaway do

  let(:name) { double :name }
  let(:user_name) { "Dom\n" }
  let(:user_number) { "#{ENV["PH_NUMBER"]}\n" }
  let(:menu_class) { double 'Menu Class', new: menu }
  let(:menu) do { "pork bao": 4, "chicken bao": 4 } end
  subject { described_class.new(menu_class) }
  let(:order_class) { double 'Order Class', new: order }
  let(:order) { double :order }

  it 'starts with an empty list of orders' do
    expect(subject.order_list).to be_empty
  end

  it 'view menu' do
    allow(menu).to receive(:view_menu).and_return(menu)
    expect(subject.view_menu).not_to be_empty
  end

  it 'customer can start order' do
    expect(subject).to receive(:puts).with("What is your name for the order?")
    expect(subject).to receive(:puts).with("What is the number for the order?")
    expect(subject).to receive(:gets).and_return(user_name , user_number)
    subject.new_order
    expect(subject.order).not_to be nil
  end

  xit 'customer can add items to order' do
    expect(subject).to receive(:puts).with("What is your name for the order?")
    expect(subject).to receive(:puts).with("What is the number for the order?")
    expect(subject).to receive(:gets).and_return(user_name , user_number)
    subject.new_order(order_class)
    expect(order).to receive(:customer).and_return(order)
    expect(order).to receive(:capitalize).and_return("Dom")
    expect(subject).to receive(:puts).with("Hi #{user_name.chomp}! What is the first item for the order?")
    expect(subject).to receive(:puts).with("How many of this item?")
    expect(subject).to receive(:gets).and_return("pork bao\n" , "2\n", "")
    expect(order).to receive(:add)
    subject.add_items
    expect(subject.order_list).not_to be_empty
  end

end
