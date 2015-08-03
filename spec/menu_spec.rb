require 'menu'

describe Menu do

  let(:biriyani){double :biriyani, title: "Biriyani", price: 5.00}

  context 'when created' do 
    it 'has a default set of dishes' do
      expect(subject.dishes).to eq Menu::DEFAULT_MENU
    end

    xit 'displays itself'
      # Don't know how to test for this
  end

  it 'can have dishes added to it' do
    subject.add_dish(biriyani, 5.00)
    expect(subject.dishes).to include biriyani
  end

  describe '#show' do 
    it 'returns an ASCII table representation of the menu using the terminal-table gem' do 
      # I don't know how to test for this
      expect(subject).to respond_to :show
    end
  end
end