require 'menu'

  describe Menu do

    subject(:menu) { described_class.new }

    it 'is an instance of Menu class' do
      expect(menu).to be_a(Menu)
    end

    it 'holds a list of dishes and prices' do
      expect(menu).to respond_to(:dishes)
    end
  end
