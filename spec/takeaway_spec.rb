require 'takeaway'

describe Takeaway do
  let(:pizza) { double(:dish, price: 10, name: "Pizza") }
  let(:chips) { double(:chips, price: 2, name: "Chips") }
  let(:menu) { double(:menu, print_menu: true, list: [pizza, chips]) }
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:order) { double(:order, add: true)}
  let(:order_class) { double(:order_class, new: order) }
  let(:takeaway) { Takeaway.new(menu_class, order_class) }

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

    it 'should tell order to respond to current_total' do
      expect(order).to receive(:current_total)
      takeaway.current_total
    end

    it 'should show the contents of the current order' do
      expect(order).to receive(:contents)
      takeaway.order_content
    end

  end

  describe '#place_order' do

    it 'should raise an error if the price given is wrong' do
    expect { subject.place_order(1, 1, 9) }.to raise_error("Total given is not correct")
    end

  end

end
