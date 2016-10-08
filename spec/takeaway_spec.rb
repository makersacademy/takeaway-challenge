require "takeaway"

describe Takeaway do

  describe 'initialization' do
    it 'should have no dishes' do
      expect(subject.dishes).to be_empty
    end
  end

  describe '#load_menu' do
    let (:filename) { 'menu.csv' }
    let (:false_filename) { 'some.csv' }

    it 'should check if file exists' do
      expect(File).to receive(:exist?).with(filename)
      subject.load_dishes(filename)
    end

    it 'should return error message when file doesnt exist' do
      allow(File).to receive(:exist?).with(false_filename).and_return false
      expect(subject.load_dishes(false_filename)).to eq "File '#{false_filename}' not found!"
    end

    it 'should try to import dishes from a file if it exists' do
      allow(File).to receive(:exist?).with(filename).and_return true
      expect(CSV).to receive(:foreach).with(filename)
      subject.load_dishes(filename)
    end
  end

  describe '#add_dish' do
    let(:dish_data) { ['Soft shell crab', '6.0'] }

    it 'should add dish item to the dishes menu' do
      subject.add_dish(dish_data)
      expect(subject.dishes.last).to eq({name: dish_data[0], price: dish_data[1]})
    end
  end
end
