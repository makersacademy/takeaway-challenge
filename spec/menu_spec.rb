require 'menu'

describe Menu do
  let(:dish) { double :dish, name: "catfish", price: 1 }
  let(:broccoli) { double :broccoli, name: "broccoli", price: 2 }
  let(:aubergine) { double :aubergine, name: "aubergine", price: 10_000 }
  let(:pumpkin) { double :pumpkin, name: "pumpkin", price: 3 }
  let(:order) { double :order, ordered: [] }
  let(:texter) { double :texter }
  let(:menu) { Menu.new(order_class: order) }

  before do
    allow(order).to receive(:new) { order }
  end

  it 'shows an empty list of dishes from the start' do
    expect(subject.dishes).to eq([])
  end

  describe '#add_dish' do
    it 'adds a dish to the menu when asked to :D' do
      subject.add_dish(dish)
      expect(subject.dishes).to eq([dish])
    end

    it 'raises error when same dishes added to menu when' do
      subject.add_dish(dish)
      expect { subject.add_dish(dish) }.to raise_error('dish on menu')
    end
  end

  describe '#display_menu' do
    it 'shows a dish that has been added as well as its price' do
      subject.add_dish(dish)
      expect(STDOUT).to receive(:puts).with("1. catfish, £1")
      subject.display_menu
    end

    it 'shows a list of crazy dishes with prices' do
      subject.add_dish(broccoli)
      subject.add_dish(aubergine)
      subject.add_dish(pumpkin)
      displayed = "1. broccoli, £2\n2. aubergine, £10000\n3. pumpkin, £3\n"
      expect { subject.display_menu }.to output(displayed).to_stdout
    end
  end

  describe 'new_order' do
    it 'creates a new order and puts it in current_order' do
      menu.new_order
      expect(menu.current_order).to eq(order)
    end
  end

  describe '#order_dish' do
    it 'can receive an order' do
      menu.new_order
      menu.add_dish(broccoli)
      expect(order).to receive(:add_to_order)
      menu.order_dish(1, 1)
    end

    it 'fails if the order is not a number' do
      error = 'please pick the dish number'
      expect { subject.order_dish("lel", 1) }.to raise_error(error)
    end

    it 'fails if the number given is not on the list' do
      error = 'please stick to numbers on the menu'
      expect { subject.order_dish(4, 1) }.to raise_error(error)
    end
  end

  describe '#recite_order' do
    it 'calls on the current order object to show the order details' do
      menu.new_order
      expect(order).to receive(:show_order)
      expect(order).to receive(:show_total)
      menu.recite_order
    end
  end

  describe '#finish_order' do
    it 'finishes the order and asks for a text to be sent' do
      finished_order = Menu.new(order_class: order, texter_class: texter)
      allow(texter).to receive(:new) { texter }
      finished_order.new_order
      allow(order).to receive(:find_total) { 10 }
      allow(texter).to receive(:send_text).with(10) { "sent" }
      expect(finished_order.finish_order).to eq(nil)
    end
  end
end
