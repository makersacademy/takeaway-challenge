require 'menu'

describe Menu do

  subject(:menu) { Menu.new("pizza") }

  it 'creates new instances of Menu class' do
    expect(menu).to be_an_instance_of(Menu)
  end

  describe '# view_menu' do
    it 'displays the selected menu' do
      text = "Margherita, £9.00\nCured Meat, £12.50\nAnchoa, £12.50\nThe Devil, £12.50\nFlorence, £12.50\nMarinara, £7.50\nNew Yorker, £13.50" 
      
      expect(menu.read_menu).to eq text
    end
  end

  # describe '# csv_to_hash' do
  #   it 'converts a csv file into a hash' do
  #     expect(menu.csv_to_hash).to be_an_instance_of(Hash)
  #   end
  # end

end
