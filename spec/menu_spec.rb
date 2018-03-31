require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  # let(:dish) { double(:dish, name: 'burger', price: 5) }
  let(:menu_display) { 'burger: $5.0, hot dog: $3.75, fries: $2.5, soda: $1.5' }

  it "has a list of dishes" do
    expect(menu.dishes.empty?).not_to be
  end

  describe '#print_menu' do

    it "returns a list of dishes with prices" do
      expect(menu.print_menu).to eq menu_display
    end

  end

  describe '#contains?' do

    it "makes sure the dish exists in the menu" do
      expect(menu.contains?('burger')).to be
    end

    it "raises error when dish is not in menu" do
      message = "This dish is not on the menu!"
      expect{ menu.contains?('something not on menu') }.to raise_error message
    end

  end

end
