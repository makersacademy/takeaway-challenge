require 'list'
require 'dish'

describe List do
  it 'should have an empty list of dishes when initialized' do
    expect(subject.dishes).to be_empty
  end

  describe '#print_list' do
    it 'should print the list of dishes' do
      expect(subject.print_list).to eq([])
    end
  end

  describe '#add' do
    dish = Dish.new('burger', 10)
    it 'should add a new dish to the list of dishes' do
      subject.add(dish)
      expect(subject.print_list). to eq([{ :name => 'burger', :price => 10 }])
    end
  end

end
