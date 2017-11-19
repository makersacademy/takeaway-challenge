require 'dishes'
describe Dishes do

  let(:printed_menu) { described_class.new.print_menu }
  context 'When asking for a list' do

    it 'Prints the list in the ouput' do
      expect { printed_menu }.to output.to_stdout
    end
  end

  context 'when selecting a dish' do
    it 'returns the specified dish' do
      expect(subject.selecting_dish('pancake')).to eq({ :Pancake => 1.0 })
    end
    it 'returns the specified dish' do
      expect(subject.selecting_dish('Waffles')).to eq({ :Waffles => 1.0 })
    end
    it 'Raise an error if the dish is not on the list' do
      expect { subject.selecting_dish('nothing') }.to raise_error(RuntimeError)
    end
  end
end
