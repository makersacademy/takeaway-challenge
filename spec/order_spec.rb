require 'order'

describe Order do
  let(:dish1){ double('menu') }
  let(:dish2){ double('menu') }
  let(:menu){ {dish3: 7.5, dish4: 10.0 } }
  subject(:order){ described_class.new(menu)}

  describe '#initialize' do
    it 'creates an empty order' do
      expect(order.current.empty?).to be true
    end
  end

  describe '#add' do
    it 'insert a single dish with 1 in quantity into the order' do
      order.add(:dish3)
      expect(order.current[0]).to include 1, :dish3, 7.5
    end

    it 'insert multiple dish with 2 in quantity into the order' do
      order.add(:dish3,2)
      order.add(:dish4,2)
      expect(order.current.length).to be 2
    end

    it 'raise argument error if dish is not on the menu' do
      expect{order.add(dish1)}.to raise_error ArgumentError
    end

    it 'raise argument error if quantity is zero or less' do
      expect{order.add(dish1,0)}.to raise_error ArgumentError
    end
  end

  describe '#show_sum' do
    it 'should calculate and show the user the sum of the order' do
      order.add(:dish3)
      order.add(:dish4)
      expect(order.show_sum).to be 17.5
    end

    it 'deals with no orders' do
      expect(order.show_sum).to be 0
    end
  end
end
