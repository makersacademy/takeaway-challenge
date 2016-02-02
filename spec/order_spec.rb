require 'order'



describe Order do

  menu = {Hamburger: 1}

  describe '#order_input'do

    it 'allows you to input your order'do
      expect(subject.order_input("Hamburger", 1, menu)).to eq([[:Hamburger],[1]])
    end

    it 'allows you to add in more than one order'do
      subject.order_input("Hamburger", 1, menu)
      expect(subject.order_input("Hamburger", 1, menu)).to eq([[:Hamburger, :Hamburger],[1, 1]])
    end
  end
  describe '#reset'do
    it 'allows you to reset your basket'do
      subject.order_input("Hamburger", 1, menu)
      expect(subject.reset).to eq ([[],[]])
    end
  end


end
