require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish, name: "beef", price: 7.5}

  it { expect(menu).to respond_to :read_menu }

  describe '#default_menu' do
    it 'checks if menu is initialized with default dishes' do
      menu1 = Menu.new
      expect(menu1[0]).to include('fried chicken')
    end
  end


end
