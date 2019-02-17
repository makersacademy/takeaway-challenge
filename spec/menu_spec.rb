require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should initialize with an empty array of dishes' do
    expect(menu.dishes).to be_empty
  end

  describe '#show_menu' do
    it 'should load and print content of #dishes instance_variable' do
      menu.show_menu
      expect(menu.dishes[0].price).to eq "5.50"
    end
  end

end
