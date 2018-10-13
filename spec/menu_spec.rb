require 'menu'

  describe Menu do

    it 'has a list of menu items' do
      expect(subject.items).not_to be nil
    end

    it 'prints out a menu of items and their prices' do
      expect(subject.list_menu)
    end


  end
