require 'menu'

  describe Menu do

    it 'has a list of menu items' do
      expect(subject.items).not_to be nil
    end

    it 'prints out list of menu items and their prices' do
      expect(subject.list_menu).to eq("Steak : £15.0\nLasanga : £8.0\nLinguine : £9.0\nPizza : £7.0\nSalmon : £14.0")
    end

  end
