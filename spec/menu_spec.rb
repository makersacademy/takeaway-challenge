require_relative '../lib/menu.rb'

describe Menu do

  describe '#show_dishes' do
    it "should out put the list of available dishes" do
      list = "name1: £1.00\nname2: £1.50\n"
      expect { subject.show_dishes }.to output(list).to_stdout
    end
  end

  describe '#check(item)' do
    it "should check the dish is on the menu (true)" do ## will need to be updated when later classes are made
      expect(subject.check(:name1)).to eq(true)
    end
    it "should check the dish is on the menu (true)" do ## will need to be updated when later classes are made
      expect(subject.check(:name3)).to eq(false)
    end
  end
end
