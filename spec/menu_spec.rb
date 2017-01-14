require 'menu'

describe Menu do

  describe '#show' do
    it 'displays menu items' do
      expect(subject.show).to eq(nil)
    end
  end

  describe '#has?' do
    it 'confirms if item is on menu' do
      expect(subject.has?("rice")).to eql true
    end
    it 'says if item is not on menu' do
      expect(subject.has?("porridge")).to eq false
    end
  end

end
