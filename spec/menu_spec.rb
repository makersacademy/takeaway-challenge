require "spec_helper"

describe Menu do

  describe '#dishes' do
    it 'subject respond_to intstruction' do
      expect(subject).to respond_to(:dishes)
    end

    it 'should return the menu' do
      test_menu = described_class.new
      expect(test_menu.dishes).to eq YAML.load_file('menu.yml')
    end
  end

  describe '#number_of_dishes' do
    it 'returns the number of dishes' do
      expect(subject.number_of_dishes).to eq(6)
    end
  end

  describe '#select()' do
    it 'selects item' do
      expect(subject.select(1,2)).to eq({dish: "Doubles",price: 4.0,quantity: 2} )
    end
  end
end
