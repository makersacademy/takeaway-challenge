require 'order'

describe Order do
  TEST_PRICE = 8
  subject { described_class.new }
  item = { "Fried Chicken": TEST_PRICE}

  describe '#initialize' do
    it 'contains list of items' do
      expect(subject.items).to be_an_instance_of(Array)
    end
  end

  describe '#show' do
    it 'shows a formatted order' do
      subject.items << item
      expect { subject.show }.to output("1. Fried Chicken - £8\n").to_stdout
    end
  end

  describe '#total' do
    it 'calculates the total of the order' do
      subject.items << item
      expect(subject.total).to be(TEST_PRICE)
    end
  end

  describe '#complete' do
    it 'completes the order'
  end
end