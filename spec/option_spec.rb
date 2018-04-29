require 'option'

describe Option do
  let(:dishes) { double :dishes, dishes: [{ item: selection, item_price: 2 }] }
  let(:selection) { double :selection }
  subject { Option.new(dishes) }

  describe '#add_option', :add_option do
    it 'adds on 1 option to meal array' do
      subject.add_option(selection, 1)
      expect(subject.dishes.length).to eq(1)
    end

    it 'selecting one option twice, adds to dishes array' do
      subject.add_option(selection, 2)
      expect(subject.dishes.length).to eq(2)
    end
  end

  describe '#total_options', :total_options do
    it 'adds total options selected from menu' do
      subject.add_option(selection, 2)
      expect(subject.total_options).to eq(4)
    end
  end
end
