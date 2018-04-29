require 'option'

describe Option do
  let(:menu) { double :menu, menu: [{ item: selection, item_price: 2 }] }
  let(:selection) { double :selection }
  subject { Option.new(menu) }

  describe '#add_dish', :add_dish do
    it 'adds one selection to the meals array' do
      subject.add_option(selection, 1)
      expect(subject.meals.length).to eq(1)
    end

    it 'adds x2 of one selection to meals array' do
      subject.add_option(selection, 2)
      expect(subject.meals.length).to eq(2)
    end
  end

  describe '#remove_option', :remove_option do
    it 'remove a dish away from the meals array' do
      subject.add_option(selection, 6)
      subject.remove_option(selection, 3)
      expect(subject.meals.length).to eq(3)
    end
  end

  describe '#total_options', :total_options do
    it 'adds total options selected from menu' do
      subject.add_option(selection, 2)
      expect(subject.total_options).to eq(4)
    end
  end
end
