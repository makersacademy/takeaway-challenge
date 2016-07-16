require 'menu'

describe Menu do
  it{is_expected.to respond_to :starters}

describe '#initialize' do
  subject {Menu.new}
  context 'when menu is created' do
    it 'holds a list of dishes and prices in a hash' do
      puts "=================#{subject.starters}================"
      expect(subject.starters).to include(TomKaKai: "£6.50")
    end
  end
end
end
