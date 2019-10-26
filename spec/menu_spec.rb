require 'menu'

RSpec.describe Menu do

  describe '#menu' do
    it 'prints a full list of available dishes' do
      expect{subject.show}.to output.to_stdout
    end
  end

  describe '#available?' do
    it 'raises error if chosen item is unavailable' do
      choice = "test"
      expect(subject.available?(choice)).to eq false
    end
  end

end
