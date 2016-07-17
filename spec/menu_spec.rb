require 'menu'

describe Menu do

  it '#display_menu' do
    expect(subject).to respond_to(:display_menu)
  end

  context '#display_menu' do
    it 'displays a list of dishes and their prices' do
      expect(subject.display_menu).to eq(subject.menu_hash)
    end
  end
end
