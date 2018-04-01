require 'menu'

describe Menu do

  subject { described_class.new }

  describe 'creation' do
    it 'creates a list with no dishes' do
      expect(subject.list).to eq []
    end
  end

  describe '#add_dish' do
    it 'should add dise(es) to the list' do
      subject.add_dish("Vongole", 1.95)
      expect(subject.list.last.name).to eq 'Vongole'
      expect(subject.list.last.price).to eq 1.95
    end
  end

  describe '#print_list' do
    it 'should print out the list' do
      subject.add_dish("Vongole", 1.95)
      expect(subject.print_list).to eq "These are our dishes and price: Dish Name: Vongole, Price: 1.95"
    end
  end



end
