require 'menu'

describe Menu do
  subject {described_class.new}
  let(:chippy_menu) { double :chippy_menu }
  let(:chinese_menu) { double :chinese_menu }

  describe 'loading menu methods' do

    it 'should make @chippy_menu have value if successfully loaded' do
      chippy_menu = subject.load_chippy_menu
      expect(chippy_menu).to_not be_empty
    end

    it 'should make @chinese_menu have value if successfully loaded' do
      chinese_menu = subject.load_chinese_menu
      expect(chinese_menu).to_not be_empty
    end
  end


end
