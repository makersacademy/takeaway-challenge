require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:order) { double :order, :string_summary => ' Spring rolls x 2: £5.00 | Pho x 1: £7.00 |' }

  it 'should respond to #read_menu with a list of dishes' do
    expect(takeaway.read_menu).to eq Menu.new.food_options
  end

  it { is_expected.to respond_to(:make_selection).with(2).arguments }

  it 'is expected to return order summary on request' do
    takeaway.make_selection('Spring rolls', 2)
    takeaway.make_selection('Pho')
    expect(takeaway.order_summary).to eq order.string_summary
  end

  describe '#place_order' do

    before :each do
      allow(takeaway).to receive(:send_text)
    end

    it 'should send text message' do
      expect(takeaway).to receive(:send_text).with("Thank you for your order: £0")
      takeaway.place_order
    end
  end

end
