require 'menu'

describe Menu do
  describe "#show" do
    it "should show a menu" do
      expect{ subject.show }.to output("\nJunk! Menu!\n-----------\nPizza    £9\nKebab    £5\nChips    £2\nPepsi    £1\n\n").to_stdout
    end
  end
end