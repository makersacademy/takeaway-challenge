require 'takeaway'

describe TakeAway do
  RSpec::Mocks.configuration.allow_message_expectations_on_nil = true

  let(:order_mock) { double('Order') }
  let(:order) { double('Order') }
  let(:order2) { double('Order') }

  let(:notifier_mock) { Notifier }
  let(:notifier) { notifier_mock.new }

  let(:dish) { 'Chicken Poke' }
  let(:quantity) { 2 }
  let(:price) { 7.99 }
  let(:dish2) { 'Salmon Poke' }
  let(:quantity2) { 1 }
  let(:price2) { 8.99 }

  let(:subject) { described_class.new(order_class: order_mock, notifier_class: notifier_mock)}

  before do
    allow(order_mock).to receive(:new).with(dish, quantity, price).and_return(order)
    allow(order_mock).to receive(:new).with(dish2, quantity2, price2).and_return(order2)

    allow(notifier_mock).to receive(:new)
    allow(notifier).to receive(:send_message)

    allow(order).to receive(:dish).and_return(dish)
    allow(order).to receive(:quantity).and_return(quantity)
    allow(order).to receive(:price).and_return(price)
    allow(order).to receive(:order_price).and_return(quantity * price)

    allow(order2).to receive(:dish).and_return(dish2)
    allow(order2).to receive(:quantity).and_return(quantity2)
    allow(order2).to receive(:price).and_return(price2)
    allow(order2).to receive(:order_price).and_return(quantity2 * price2)
  end

  describe '#initialize' do
    it 'has an empty basket by dfault' do
      expect(subject.basket).to be_empty
    end
  end

  describe '#read_menu' do
    it 'reads the menu of dishes' do
      subject.menu = [{ name: 'Chicken Poke', price: 7.99 }, { name: 'Salmon Poke', price: 8.99 }]
      result = "Chicken Poke £7.99\nSalmon Poke £8.99\n"
      expect { subject.read_menu }.to output(result).to_stdout
    end
  end

  describe '#order_dish' do
    it "checks if a dish doesn't exist and raise an error" do
      dish3 = 'Chicken'
      expect { subject.order_dish(dish3) }.to raise_error "This dish doesn't exist"
    end

    it 'adds the order to the total' do
      result = 15.98
      allow(order).to receive(:order_price).and_return(result)
      subject.order_dish(dish, quantity)
      expect(subject.total).to eq result
    end

    it 'prints the order added to the basket' do
      result = "2 Chicken Poke added to your basket\n"
      expect { subject.order_dish(dish, quantity) }.to output(result).to_stdout
    end

    it 'adds the order to the basket' do
      subject.order_dish(dish, quantity)
      expect(subject.basket).to include order
    end
  end

  describe '#print_basket' do
    it 'prints the basket' do
      subject.order_dish(dish, quantity)
      subject.order_dish(dish2)
      result = "Chicken Poke x2 = £15.98\nSalmon Poke x1 = £8.99\n"
      expect { subject.print_basket }.to output(result).to_stdout
    end
  end

  describe '#check_total' do
    it 'prints the total' do
      subject.order_dish(dish, quantity)
      subject.order_dish(dish2, quantity2)
      result = "Total: £24.97\n"
      expect { subject.check_total }.to output(result).to_stdout
    end
  end

  describe '#deliver_order' do
    it 'accept the deliver request and send a text confirmation to the costumer' do
      now = "21:54"
      txt = "Thank you for your order: £24.97. Your order was placed and will be delivered before " + now + "\n"
      subject.order_dish(dish, quantity)
      allow(subject).to receive(:now_time).and_return(now)
      subject.order_dish(dish2, quantity2)
      expect { subject.deliver_order }.to output(txt).to_stdout
    end
  end
end
