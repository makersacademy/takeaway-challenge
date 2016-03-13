require 'menu'

describe Menu do
  subject(:menu){ described_class.new }

  describe "#initialize" do
    it "initializes with a hash of symbols and integers" do
      arr = []
      menu.menu.each_pair{|k,v| arr << ((k.is_a? Symbol) && (v.is_a? Integer))}
      expect(arr).not_to include false
    end

  end


end
