require 'takeaway'

describe TakeAway do
  let(:dish_init) { double(:dish_init ) }
  let(:dish_class) { double(:dish_class, new: dish_init) }

  let(:conf) { double(:order_confirmation, send_sms: "sms" ) }
  let(:confirmation_class) { double(:confirmation_class, new: conf) }

  subject(:takeaway) { described_class.new(dish_class,confirmation_class) }
  let(:name) { double :name }
  let(:quantity) { double :quantity }
  let(:total_received) { double :total_received}
  let(:total) { double :total }

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
      expect(conf).to receive(:send_sms)
      total_received = 20
      total_received = takeaway.total
      takeaway.order(total_received)
    end
  end




end
