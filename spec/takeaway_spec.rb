require 'takeaway'

describe Takeaway do
  let(:pizza) { double(:dish, price: 10, name: "Pizza") }
  let(:chips) { double(:chips, price: 2, name: "Chips") }
  let(:menu) { double(:menu, print_menu: true, list: [pizza, chips]) }
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:order) { double(:order, add: true) }
  let(:order_class) { double(:order_class, new: order) }
  let(:sms) { double(:sms, send_confirmation: true)}
  let(:sms_class) {double(:sms_class, new: sms)}
  let(:takeaway) { Takeaway.new(menu_class, order_class, sms_class) }
  let(:time) { (Time.new + 3600).strftime("%H:%M:%S") }

  describe '#initialize' do

    it 'should initialize with a menu' do
      expect(takeaway.menu).to eq menu
    end

    it 'should initialize with a order' do
      expect(takeaway.order).to eq order
    end
  end

  describe '#see_menu' do

    it 'should tell menu to call print_menu' do
      expect(menu).to receive(:print_menu)
      takeaway.print_menu
    end
  end

  describe '#order' do

    it 'should tell order to respond to add' do
      expect(order).to receive(:add)
      takeaway.add_to_order(1, 1)
    end

    it 'should add item x times' do
      expect(order).to receive(:add).exactly(3).times
      takeaway.add_to_order(1, 3)
    end

  end

  describe '#place_order' do

    it 'should raise an error if the price given is wrong' do
      error = "Total given is not correct"
      allow(takeaway).to receive(:total).and_return(8)
      expect { takeaway.place_order(9) }.to raise_error(error)
    end

    it 'should tell sms to respond to send_confirmation' do
      allow(takeaway).to receive(:total).and_return(9)
      expect(sms).to receive(:send_confirmation)
      takeaway.place_order(9)
    end

  end
end
