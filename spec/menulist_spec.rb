require 'menulist'
describe MenuList do
  let (:including_class){ Class.new { include MenuList } }

  describe '#select'do
    it 'allows you to select a menu'do
      expect(including_class.new.select(:burger)).to eq ({:Hamburger => 4.50, :Cheeseburger => 4.60, :Chips => 1.00} )
    end
    it 'allows you to select a menu'do
      expect(including_class.new.select(:wine)).to eq ({:red => 3.00, :white => 3.00, :blue => 10.00})
    end

  end
end
