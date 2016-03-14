require 'takeaway'

describe Takeaway do
  let(:order){ double('order', current: [1, dish1, 7.5]) }
  let(:order_klass){ double('order_klass', new: order) }
  let(:text){ double('text', send_confirmation: nil) }
  let(:dish1){ double('menu') }
  let(:dish2){ double('menu') }
  let(:menu){ double('menu', dishes: { dish1 => 7.5, dish2 => 10.0 })}
  subject(:takeaway){ described_class.new(order_klass,menu,text) }


  describe '#initialize' do
    it 'initiates menu' do
      expect(takeaway.menu).to eq menu
    end
  end

  describe '#to_s' do
    it 'shows the menu' do
      allow(menu).to receive(:show)
      expect(menu).to receive(:show)
      takeaway.to_s
    end
  end

  describe '#new_order' do
    it 'creates a new order' do
      expect(order_klass).to receive(:new)
      takeaway.new_order
    end

    it 'sends only the dishes' do
      expect(menu).to receive(:dishes)
      takeaway.new_order
    end
  end

  describe '#place' do
    before do
      allow(order).to receive(:show_sum){7.5}
      takeaway.new_order
    end

    it 'calls the show_sum in order' do
      expect(order).to receive(:show_sum){7.5}
      takeaway.place(order,7.5)
    end

    it 'should raise an error if not the correct sum' do
      msg = "Incorrect value - should be £#{order.show_sum}"
      expect{takeaway.place(order, 6.5)}.to raise_error msg
    end
  end

  describe '#confirmation' do
    before do
      allow(text).to receive(:send_confirmation)
      allow(order).to receive(:show_sum){7.5}
      takeaway.new_order
    end

    it 'calls the confirmation' do
      expect(text).to receive(:send_confirmation)
      takeaway.place(order,7.5)
    end

  end

end
