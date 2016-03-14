require 'takeaway'

describe TakeAway do
  let(:conf) { double(:order_confirmation, send_sms: sms ) }
  let(:confirmation_class) { double(:confirmation_class, new: conf) }
  let(:dish_init) { double(:dish_init ) }
  let(:dish_class) { double(:dish_class, new: dish_init) }

  subject(:takeaway) { described_class.new }
  let(:name) { double :name }
  let(:quantity) { double :quantity }
  let(:total_received) { double :total_received}
  let(:total) { double :total }
  let(:FakeSMS) { double :FakeSMS}
  # before(:each) do
  #   stub_const("Twilio::REST::Client", OrderConfirmation)
  # end

  it { is_expected.to respond_to(:basket)}
  it { is_expected.to respond_to(:total) }
  it { is_expected.to respond_to(:order).with(1).argument }
  it { is_expected.to respond_to(:text_message)}


  describe '#list_menu' do
    it 'has hash of dish instances' do
      expect(takeaway.list_menu.class).to eq Hash
    end
  end

  describe '#add_to_basket' do
    it 'puts dish instances in basket' do
      expect do
        takeaway.add_to_basket(name,quantity)
      end.to change{ takeaway.basket.length }.by(1)
    end
  end

  describe '#order' do
    message = 'Total received doesn\'t match total price'
    it 'raises error' do
      expect { takeaway.order(total_received) }.to raise_error message
    end

    it 'sends text when total received matches total price' do
      takeaway.add_to_basket name, quantity
      total_received = 20
      total_received = takeaway.total
      message = "Thank you for your order. You've paid £#{takeaway.total}. Your food will arrive in 40-60m."
      expect(takeaway.order(total_received)).to eq message
    end
  end




end
