require 'menu'

describe TakeAway do 

  it 'checks that a class exists' do
    expect(subject).to be_a TakeAway
  end

  describe '#display_menu' do
    it 'displays a menu' do
      expect(subject).to respond_to :display_menu
    end

    it 'prints available dishes' do
      expect(subject.display_menu).to eq({ "margarita" => 5, "fries" => 3 })
    end
  end 
end 
