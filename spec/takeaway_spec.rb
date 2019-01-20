require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order_class, sms_class) }
  let(:order_class)  { double :order_class, new: order }
  let(:order)        { double :order, menu: menu, add: [1.99, 2], total: "£2.98", receipt: "Order: Fries, £1.99 x2 = £2.98 \nTotal Price: comes to £2.98" }
  let(:menu)         { double :menu, dishes: [dish1, dish2], print_menu: "Pizza £4.99, Fries £1.99" }
  let(:dish1)        { double :dish, name: "Pizza", price: 5.00 }
  let(:dish2)        { double :dish, name: "Fries", price: 1.99 }
  let(:sms_class)    { double :sms_class, new: sms }
  let(:sms)          { double :sms, send: "Nothing sent!"}

  describe '#new' do
    it 'Should initialize with an order object' do
      expect(takeaway.order).to eq order
    end
  end

  describe '#print_menu' do
    it 'Should respond to print_menu' do
      expect(takeaway.print_menu).to eq "Pizza £4.99, Fries £1.99"
    end
  end

  describe '#add' do
    it 'Should respond to add' do
      expect(takeaway.add(dish1, 6)).to eq [1.99, 2]
    end
  end

  describe '#total' do
    it 'Should respond to total' do
      expect(takeaway.total).to eq "£2.98"
    end
  end

  describe '#receipt' do
    it 'Should respond to receipt' do
      message = "Order: Fries, £1.99 x2 = £2.98 \nTotal Price: comes to £2.98"
      expect(takeaway.receipt).to eq message
    end
  end

  describe '#confirm_order' do
    it 'Should respond to confirm_order' do
      expect(takeaway.confirm_order).to eq "Nothing sent!"
    end
  end

end
