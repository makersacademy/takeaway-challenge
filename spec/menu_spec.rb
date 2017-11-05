require './lib/menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

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

  describe '#search' do
    it 'should search MENU and find the specified dish' do
      expect(subject.search(:Jalfrezi)).to eq subject.list[:Jalfrezi]
    end

    it 'should change string to downcase, then capitalize, then to a symbol' do
      expect(subject.search('jaLfrEzI')).to eq subject.list[:Jalfrezi]
    end

    it 'should remove white space from string' do
      expect(subject.search('Tikka Masala')).to eq subject.list[:Tikkamasala]
    end
  end
end
