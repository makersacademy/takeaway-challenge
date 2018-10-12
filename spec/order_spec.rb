require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#add_items' do

    it 'can add a single item' do
      subject.add_items('pizza', 1)
      expect(subject.order_summary).to eq({ 'pizza' => 1 })
    end

    it 'Can add a single item with a quantity greater than 1' do
      subject.add_items('pizza', 2)
      expect(subject.order_summary).to eq({ 'pizza' => 2 })
    end

    it 'Can add multiple items' do
      subject.add_items('pizza', 1)
      subject.add_items('burger', 1)
      expect(subject.order_summary).to eq({ 'pizza' => 1, 'burger' => 1 })
    end

    it 'Can add multiple items of variable quantities' do
      subject.add_items('pizza', 1)
      subject.add_items('burger', 2)
      expect(subject.order_summary).to eq({ 'pizza' => 1, 'burger' => 2 })
    end

    it 'The same item can be added multiple times' do
      subject.add_items('burger', 1)
      subject.add_items('pizza', 1)
      subject.add_items('burger', 1)
      expect(subject.order_summary).to eq({ 'burger' => 2, 'pizza' => 1 })
    end

  end

  describe '#order_summary'

  "spring roll x4 = £3.96, pork dumpling x3 = £8.97"

    it 'single item' do
      subject.add_items('pizza', 1)
      expect(subject.order_summary).to eq( 'pizza x1 = £6.99')
    end

    it 'single item with quantity greater than 1' do
      subject.add_items('pizza', 2)
      expect(subject.order_summary).to eq( 'pizza x2 = £13.98')
    end

    it 'multiple items of quantitity of 1' do
      subject.add_items('pizza', 1)
      subject.add_items('burger', 1)
      expect(subject.order_summary).to eq( 'pizza x1 = £6.99, burger x1 = £3.00')
    end

    it 'multiple items of multiple quantities' do
      subject.add_items('pizza', 1)
      subject.add_items('burger', 2)
      expect(subject.order_summary).to eq( 'pizza x1 = £6.99, burger x2 = £6.00')
    end

  end


end
