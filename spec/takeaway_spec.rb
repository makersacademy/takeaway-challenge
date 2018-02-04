require 'takeaway'

describe Takeaway do

  let(:order)       { double('order')                                          }
  let(:order_class) { double('order_class', new: order)                        }
  let(:options)     { double('options')                                        }
  let(:menu)        { double('menu', print_centered: 'menu', options: options) }
  let(:menu_class)  { double('menu_class', new: menu)                          }
  let(:takeaway)    { described_class.new(menu_class, order_class)             }

  describe '#print_menu' do
    it 'delegates printing to menu object' do
      expect(takeaway.print_menu).to eq 'menu'
    end
  end

  describe '#take_order' do
    it 'delegates order noting to order object' do
      expect(order).to receive(:note_down).with(options).and_return 'order noted'
      expect(takeaway.take_order).to eq 'order noted'
    end
  end

  describe '#verify_order' do
    it 'delegates order verification to order object' do
      expect(order).to receive(:print_verification).with(options).and_return 'order verified'
      expect(takeaway.verify_order).to eq 'order verified'
    end

  describe '#finish_order' do
    before(:each) do
    allow(order).to receive(:send_verification_text)
    end

    it 'delegates sms confirmation to order object' do
      expect(order).to receive(:send_verification_text)
      takeaway.finish_order
    end

    it 'creates a new order object' do
      expect(takeaway.finish_order).to be_an_instance_of Order
    end
  end
  end
end
