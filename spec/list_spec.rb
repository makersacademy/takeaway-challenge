#spec file for list class
require './lib/list'
describe List do
    # subject(:list){described_class.new}
  let(:list){List.new}
  let(:dish){instance_double(Dish)}

  it "has an empty array of dishes upon creation" do
    expect(list.dishes).to eq []
  end

  describe '#read' do
    it "returns the dishes array " do
      expect(list.read).to eq list.dishes
    end
  end

  describe '#add' do
    it 'adds a dish instance to the dishes array' do
      list.add(dish)
      expect(list.dishes).to include(dish)
    end
  end

  describe '#get' do
    it 'gets the corresponding list item' do
      list.add(dish)
      expect(list.get(0)).to eq dish
    end
  end

  describe '#print' do
    it 'prints the list\'s array of dishes' do
      expect{list.print}.to output(list.dishes.to_s+"\n").to_stdout
    end
  end

  end
