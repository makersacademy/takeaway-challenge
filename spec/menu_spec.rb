require 'menu'

describe Menu do

  describe '#list' do
    it 'returns the keys of the menu in an array' do
      expect(subject.list).to match_array([:pizza, :lasagne, :omlette])
    end
  end

  describe '#price' do
    it 'returns the correct price for an item on the menu' do
      expect(subject.price :pizza).to be(subject.items[:pizza])
    end
  end

  describe '#display_menu' do
    it 'prints the menu to the console' do
      puts '  **This was tested manually**'
    end
  end

  describe '#check_inclusion?' do
    it 'returns true when provided a valid food item' do
      example = subject.items.keys[0]
      expect(subject.check_inclusion? example).to be true
    end

    it 'returns false when provided an invalid food item' do
      expect(subject.check_inclusion? :bicycle).to be false
    end
  end

end
