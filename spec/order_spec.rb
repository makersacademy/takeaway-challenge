require 'order'

describe Order do
#change subject to subject(:Order) { described_classes.new}
  context 'to select some number of available dishes' do
    it 'initialize with an empty array of dishes' do
      expect(subject.select_dish).to eq []
    end

    it 'adds selected dishes to the select_dish empty array' do
      subject.add_selected_dish('name')
      expect(subject.select_dish).to include 'name'
    end
  end
end
