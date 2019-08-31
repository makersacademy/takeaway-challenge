require 'menu'
describe Menu do
  subject(:menu) { described_class.new }
  it "contains menu options" do
    # menu_double = double :menu, dishes: {margherita: 7.00}
    # display_menu_double =
    # allow(menu). to receive(:dishes) { {margherita: 7.00}}
    #allow(menu). to receive(:display_menu) { :dishes }
    expect(subject.dishes).to include(:margherita, :marinara, :meatfeast, :vegetarian)
    # expect(subject.display_menu).to eq(subject.dishes)
  end
  describe "#display_menu" do
    it "puts out the menu" do
      expect{ subject.display_menu }.to output.to_stdout
    end
  end

  # describe '#awesome' do
  #   it 'prints awesome things' do
  #     expect do
  #       MakeIt.new.awesome('tests')
  #     end.to output('Awesome tests').to_stdout
end
