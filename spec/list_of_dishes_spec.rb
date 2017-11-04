require './lib/list_of_dishes.rb'

describe ListOfDishes do
  subject(:list_of_dishes) { ListOfDishes.new }

  describe 'initialize' do
    it 'should have a list of Dish objects' do
      expect(subject.list.count).to eq 17
    end

    it 'should be able to access name of a Dish in List' do
      expect(subject.list[:Balti].name).to eq 'Balti'
    end

    it 'should be able to access price of a Dish in List' do
      expect(subject.list[:Balti].price).to eq 8
    end
  end
end
