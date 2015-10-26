require 'menu'

describe Menu do

  it 'allows to display dishes as a well formatted list' do
    subject.add_dish("Prosciutto",12)
    expect(subject.display_menu).to eq('pizza: £12, burger: £10, Prosciutto: £12')
    end

  describe '#remove_dish' do
    it 'can remove dishes' do
    subject.add_dish("Prosciutto",12)
    expect(subject.remove_dish("Prosciutto")).to eq({"pizza" => 12, "burger" => 10})
    end
  end


end
