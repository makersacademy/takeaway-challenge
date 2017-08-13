require 'menu'

describe Menu do

  context 'initializing menu' do

    it 'initializes with a blank hash' do
      expect(subject.list).to eq Hash.new
    end

  end

  context 'adding dishes' do

    it 'allows dishes to be added manually to the menu' do
      expect { subject.add_dish("food", 3.3) }.to change { subject.list.length }. by 1
    end

    it 'adds dishes as hashes' do
      subject.add_dish("food", 3.3)
      expect(subject.list)
    end

  end

  context 'removing dishes' do

    it 'allows dishes to be manually removed from the menu' do
      subject.add_dish("food", 3.3)
      expect { subject.remove_dish("food") }.to change { subject.list.length }. by(-1)
    end

  end

  context 'importing menus' do

    it 'raises error if the menu is not a hash' do
      error1 = "Not in correct format (items must be stored as hashes)"
      expect { subject.import_menu(["asdf", 123]) }.to raise_error error1
    end

    it 'adds all items of the import to the menu list if in valid form' do
      example_ary = { "item1" => 5, "item2" => 10 }
      expect { subject.import_menu(example_ary) }.to change { subject.list.length }. by 2
    end

  end

  context "reading menus" do

    it "can display the menu of the restaurant" do
      subject.import_menu({ "item1" => 5, "item2" => 10 })
      menulist = "item1 ------- £5\nitem2 ------- £10\n"
      expect { subject.display_list }.to output(menulist).to_stdout
    end

  end

end
