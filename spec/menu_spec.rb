require 'menu'

describe Menu do
  subject (:menu) { Menu.new }
  
  let (:dishes) do
    <<~MENU
      Beef burger: 14
      Chicken burger: 12
      Hot dog: 11
      Fries: 4
      Soft drink: 3
      Milkshake: 5
    MENU
  end

  describe '#view' do
    it { is_expected.to respond_to(:view) }

    it 'shows a menu' do
      allow(menu).to receive(:view) { "Menu" }
      expect(menu.view).to eq "Menu"
    end

    specify { expect { menu.view }.to output(dishes).to_stdout }
  end
end
