require 'menu'

describe Menu do
  let(:menu) {Menu.new}
  @message = "Garlic Bread: £5
Dips: £3
Margherita: £7
Frutti di Mare: £11
Romana: £10
Americana: £11
Padana: £9
Calzone: £12
Diavola: £12"

  it 'should initialize with menu_items' do
    expect(subject.menu_items.length).to eq 9
  end

   it 'should be an instance of menu class' do
     expect(menu).to be_a Menu
   end

  describe '#view_menu' do
    it 'outputs the menu' do
      expect{ menu.view_menu }.to output(@message).to_stdout
    end
  end
end
