require 'takeaway'
require 'menu'
require 'basket'
describe TakeAway do
  subject(:takeaway) { described_class.new(menu, basket, sms, config: {}) }

  let(:menu) { instance_double "Menu", generator: user_list, list: list }
  let(:user_list) { double :user_list }
  let(:list) { double :list }
  let(:list_number) { double :list_number }
  let(:value) { double :value }
  let(:dish) { double :dish }
  let(:basket) { instance_double("Basket") }
  let(:sms) { double :sms, deliver: nil }



  it ' #gets_menu' do
    expect(takeaway.gets_menu).to eq user_list
  end

  it ' #adds dish and quantity from the menu' do
    allow(list).to receive(:[]).and_return dish
    expect(basket).to receive(:adding).with(dish, value)
    takeaway.adds(list_number, value)
  end

  it ' #checks_out calculating the sum of order' do
    expect(basket).to receive(:total)
    takeaway.checks_out
  end

  it 'sends an sms when order is done' do
    allow(basket).to receive(:total)
    expect(sms).to receive(:deliver)
    takeaway.checks_out
  end
end
