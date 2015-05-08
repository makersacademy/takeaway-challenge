require 'menu'

describe Menu do

  context 'Viewing the menu' do

    it 'Displays the current dishes on the menu' do
      expect(subject.show_menu).to be_a_kind_of(Array)
    end

  end

end