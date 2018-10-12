require 'order'

describe Order do

  let(:pizza) { double :pizza, name: 'Pizza', price: 7.85 }
  let(:pasta) { double :pasta, name: 'Pasta', price: 5.85 }
  let(:salad) { double :salad, name: 'Salad', price: 5.85 }

  before(:each) do
    allow(pizza).to receive(:price).and_return(7.85)
    allow(pasta).to receive(:pasta).and_return(5.85)
    allow(salad).to receive(:salad).and_return(5.85)
  end

  describe '#check_bill' do
    context "order given with correct total" do
      subject { described_class.new(dishes: { pizza => 1, pasta => 1, salad => 1 }, bill: 19.55) }
      it 'should send confirmation text message to customer' do
        allow(subject).to receive(:send_text)
        subject.check_bill
        expect(subject).to have_received(:send_text)
      end
    end
    context "order given with incorrect total" do
      subject { described_class.new(dishes: { pizza => 2, pasta => 1, salad => 1 }, bill: 19.55) }
      it 'should create order and send text message to customer' do
        expect { subject.check_bill }.to raise_error('Incorrect Bill')
      end
    end
  end

  describe '#confirmation_text' do
    it
  end


end
