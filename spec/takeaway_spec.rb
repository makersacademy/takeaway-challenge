# frozen_string_literal: true

require './lib/takeaway'

describe Takeaway, :aggregate_failures do
  subject             { init_subject }

  let(:sms_class)     { class_double('SMSSender', new: sms_instance) }
  let(:sms_instance)  { instance_double('SMSSender') }

  let(:menu_class)    { class_double('Menu', new: menu_instance) }
  let(:menu_instance) { instance_double('Menu') }

  let(:menu_hash)     { { 'Cafe Latte' => '4.75', 'Cappuccino' => '3.85' } }
  let(:cafe_latte)    { MenuItem.new('Cafe Latte', '4.75') }
  let(:cappuccino)    { MenuItem.new('Cappuccino', '3.85') }

  def init_subject
    described_class.new(sms_class, menu_class, menu_hash)
  end

  context 'when initializing' do
    it 'should use the Menu class by default' do
      expect(described_class.new.menu).to be_instance_of Menu
    end

    it 'should use the SMSSender class by default' do
      class TestableTakeaway < Takeaway; attr_reader :sms_sender; end
      expect(TestableTakeaway.new.sms_sender).to be_instance_of SMSSender
    end

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
      allow(sms_instance).to receive(:send_sms)
      subject.send_sms_confirmation(to: '+44123456789', body: 'Body')

      expect(sms_instance).to(have_received(:send_sms)
                          .with('+44123456789', 'Body'))
    end

    context 'when ordering items by their index' do
      before :each do
        allow(menu_instance).to receive(:items_at).and_return([cappuccino])
      end

      it 'should return an instance of the Order class' do
        expect(subject.order([1])).to be_instance_of Order
      end

      it 'should delegate the request to the menu object' do
        subject.order([1])
        expect(menu_instance).to have_received(:items_at).with([1])
      end
    end
  end
end