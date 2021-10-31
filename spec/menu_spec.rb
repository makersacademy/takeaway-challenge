require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#show_menu' do
    it 'should return list of dishes with prices' do
      expect(subject.show_menu).to eq({ "egg fried rice" => 2,"special fried rice" => 2,"prawn toast" => 2,
        "chicken balls" => 2.5,"spring rolls" => 2.5,"char siu pork" => 3,
        "beef chow mein" => 3.5,"spare ribs" => 3.5 })
    end
  end
end
