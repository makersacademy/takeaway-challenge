require 'order'

describe Order do

  describe '#load_menu' do
    it 'displays the menu items' do
      menu_double = double(menu_list: "string")
      expect(Menu).to receive(:new).and_return(menu_double)
      expect(menu_double).to receive(:load_from_csv).with("any filename")

      expect{ subject.load_menu("any filename") }.to output("string\n").to_stdout
    end
  end

end
