require 'takeaway'

describe Takeaway do
  let(:order_time_double) { double(:order_time, delivery_time: "18:52") }
  let(:order_time_class_double) { double(:order_time_class, new: order_time_double) }
  let(:menu_double) { double(:menu) } 
  let(:twilio_api_double) { double(:twilio_api, send: "Thank you, your order was placed and will be delivered before 18:52") } 
  let(:takeaway) { described_class.new(order_time_class_double, menu_double, twilio_api_double) }

  describe '#begin_order' do
    it 'menu class starts an order' do
      expect(menu_double).to receive(:start)
      takeaway.begin_order
    end
  end

  describe '#print_current_order' do
    it 'exists' do
      expect(menu_double).to receive(:print_current_order)
      takeaway.print_current_order
    end
  end

  describe '#select' do
    it 'menu class receives select' do
      expect(menu_double).to receive(:select).with('bread', 1)
      takeaway.select('bread')
    end
  end

  describe '#print_menu' do
    it 'menu class receives order' do
      expect(menu_double).to receive(:print_menu)
      takeaway.print_menu
    end
  end

  describe '#complete_order' do
    context 'entering the correct price' do
      it 'confirms the order' do
        allow(menu_double).to receive(:order_price).and_return(1)
        expect(takeaway.complete_order(1))
        .to eq 'Thank you, your order was placed and will be delivered before 18:52'
      end
    end

    context 'entering the incorrect price' do
      it 'raises an error' do
        allow(menu_double).to receive(:order_price).and_return(5)
        expect { takeaway.complete_order(1) }
        .to raise_error "Cannot complete order: Incorrect Value"
      end
    end
  end
    
end
