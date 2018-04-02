require 'menu'

describe Menu do

  subject { described_class.new }
  let(:dish) { double :dish }
  let(:price) { double :price }

  describe 'creation' do
    it 'creates a list with no dishes' do
      expect(subject.list).to eq []
    end
  end

  describe '#add_dish' do
    it 'should add dise(es) to the list' do
      subject.add_dish(dish, price)
      expect(subject.list.last.name).to eq dish
      expect(subject.list.last.price).to eq price
    end
  end

  describe '#print_list' do
    it 'should print out the list' do
      subject.add_dish(dish, price)
      expect(subject.print_list).to eq "These are our dishes and price: Dish Name: #{dish}, Price: #{price}"
    end
  end

  describe '#contain?' do
    it 'should raise an error when the dish is not on the takeaway menu' do
      expect { subject.contain?(dish) }.to raise_error "This dish is not on our takeaway menu."
    end

    it 'should return true when the dish is on the takeaway menu' do
      subject.add_dish(dish, price)
      expect(subject.contain?(dish)).to eq true
    end
  end

  describe '#price?' do
    it 'should return the price for searched dish' do
      subject.add_dish(dish, price)
      expect(subject.price?(dish)).to eq price
    end
  end

end
