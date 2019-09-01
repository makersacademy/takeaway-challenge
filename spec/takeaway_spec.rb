# frozen_string_literal: true

require './lib/takeaway'

describe Takeaway do
  include_examples 'Test Helpers'

  subject              { init_subject }

  let(:sms_class)      { class_double('SMSSender', new: sms_instance) }
  let(:sms_instance)   { instance_double('SMSSender') }

  let(:menu_class)     { class_double('Menu', new: menu_instance) }
  let(:menu_instance)  { instance_double('Menu') }

  let(:order_class)    { class_double('Order', new: order_instance) }
  let(:order_instance) { instance_double('Order') }

  let(:cafe_latte)     { MenuItem.new('Cafe Latte', '4.75') }
  let(:cappuccino)     { MenuItem.new('Cappuccino', '3.85') }

  def init_subject(class_name = described_class)
    class_name.new(menu_hash: menu_hash,
                   sms_class: sms_class,
                   menu_class: menu_class,
                   order_class: order_class)
  end

  context 'when initializing' do
    it 'should create a new menu object with menu items' do
      init_subject
      expect(menu_class).to have_received(:new).with([cafe_latte, cappuccino])
    end
  end

  context 'ordering a delivery' do
    it 'should be able to return a copy of the menu' do
      allow(menu_instance).to receive(:dup)

      expect(subject.menu).not_to be menu_instance
      expect(menu_instance).to have_received(:dup)
    end

    it 'should be able to send an sms' do
      allow(order_instance).to receive(:contact_number).and_return('+44123456789')
      allow(order_instance).to receive(:to_string).and_return('Test Order')
      allow(sms_instance).to receive(:send_sms)

      subject.send_confirmation(order: order_instance)
      expect(sms_instance).to(have_received(:send_sms)
                          .with('+44123456789', 'Test Order'))
    end

    context 'when ordering items by their index' do
      DEFAULT_DELIVERY_WINDOW = Takeaway::DEFAULT_DELIVERY_WINDOW

      before :each do
        allow(menu_instance).to receive(:items_at).and_return([cappuccino])
      end

      it 'should return an instance of the Order class' do
        expect(subject.order([1])).to be order_instance
      end

      it "should instantiate the order with a #{DEFAULT_DELIVERY_WINDOW / 3600} hour window" do
        allow(menu_instance).to receive(:items_at).and_return(nil)
        subject.order([1])

        expect(order_class).to have_received(:new).with(nil, DEFAULT_DELIVERY_WINDOW)
      end

      it 'should delegate the request to the menu object' do
        subject.order([1])
        expect(menu_instance).to have_received(:items_at).with([1])
      end
    end
  end
end