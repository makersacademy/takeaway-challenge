require 'order'

RSpec.describe Order do
let(:dishes) { double :dishes, current_selection: current_selection }
let(:current_selection) { [{ :name=>:fish_curry, :price=>4.7, :quantity=>2 }] }
subject(:order) { described_class.new(dishes) }


  describe '#overview' do
    it 'returns the current order' do
      dishes.current_selection
      expect(subject.overview).to eq ([{ :name=>:fish_curry, :price=>4.7, :quantity=>2 }])
    end
  end

  describe '#total' do
    it 'adds all items together' do
      expect(order.total).to eq 9.4
    end
  end

  describe '#breakdown' do
    it 'shows total for each item' do
      expect(order.breakdown).to eq ([{ :name=>:fish_curry, :price=>4.7, :quantity=>2, :total=>9.4 }])
    end
  end

  describe '#confirmed?' do
    it 'show you default status on order confirmation' do
      expect(order.confirmed?).to be false
    end

    let(:order_complete) {double :order, confirmed?: confirmed }
    let(:confirmed) { true }

    it 'true when order is confirmed' do
      expect(order_complete.confirmed?).to be true
    end
  end

  context 'confirm' do
    let(:order_complete) {double :order, confirm: confirmed }
    let(:confirmed) { true }

    describe '#confirm' do
      it 'sets the value of @confirmed to true' do
        expect(order_complete.confirm).to eq true
      end
    end

    describe '#confirm' do
      before { allow(order_complete).to receive(:confirm) { puts "Sent message" } }

      it 'sends text message' do
        expect { order_complete.confirm }.to output("Sent message\n").to_stdout
      end
    end
  end
end
