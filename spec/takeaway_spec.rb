require 'takeaway'

describe Takeaway do

  let(:dish1) { double :dish, :name => 'milk', :price => 2 }
  let(:dish2) { double :dish, :name => 'chips', :price => 3 }
  let(:menu) { double :menu, :dishes => [dish1, dish2], :find_dish => dish2 }
  let(:menu_class) { double :menu_class, :new => menu }
  let(:message) { double :message, :sid => 'ID' }
  let(:messages) { double :messages, :create => message }
  let(:account) { double :account, :messages => messages }
  let(:client) { double :client, :account => account }
  let(:client_class) { double :client, :new => client }
  let(:subject) { Takeaway.new(menu_class) }

  it 'read_menu returns a menu object' do
    expect(subject.read_menu). to eq({ 'milk' => 2, 'chips' => 3 })
  end

  it 'select_dish adds the chosen dish to the current order' do
    subject.select_dish('chips')
    expect(subject.current_order.dishes).to include dish2
  end

  it 'show_order shows a total of zero when no food is ordered' do
    expect { subject.show_order }.to output("Total: £0\n").to_stdout
  end

  it 'show_order shows the total sum of ordered food and the order' do
    allow(menu).to receive(:find_dish).and_return(dish1, dish2)
    subject.select_dish('milk')
    subject.select_dish('chips')
    expect { subject.show_order }.to output("1. milk, £2\n2. chips, £3\nTotal: £5\n").to_stdout
  end

  it 'mocks the twilio client interface' do
    expect(client.account.messages.create.sid).to eq 'ID'
  end

  it 'raise an error if the order total is not correct when order is placed' do
    subject.select_dish('milk')
    subject.select_dish('chips')
    expect { subject.place_order(99) }.to raise_error 'Order total is not correct'
  end

end
