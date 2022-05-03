require './docs/menu'

describe Menu do
  it 'responds to Menu class' do
    expect(subject).to be_an_instance_of Menu
  end

  describe '#see menu' do
    it 'returns the menu' do
      expect(subject.show_menu).to eq({ "Espresso Martini" => 12.5, "Guinness" => 6.0, "Huel" => 3.0, "Ruddles" => 1.99 })
    end
  end
end
