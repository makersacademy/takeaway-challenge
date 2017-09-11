require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, menu_items: menu_items) }
  let(:order) { double :order }
  let(:sms) { double :sms, deliver: nil }
  let(:menu_items) do

    {
      chicken: 3.99,
      falafel: 4.50
    }

  end

  describe "#initialize" do
    it 'instantiates a new takeaway' do
      expect(takeaway).to eq takeaway
    end
  end

  it 'can read a menu' do
    expect(subject.menu). to eq(menu)
  end

  it 'can print out a list of dishes by name and price' do
    expect(takeaway.print_menu).to eq(menu_items)
  end

  it 'sends an SMS when the order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.place_order(takeaway.order.chosen_items)
  end

end
