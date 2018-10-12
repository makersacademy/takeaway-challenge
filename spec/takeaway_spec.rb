require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, list_dishes: <<~HEREDOC
              * * * PAPA'S * PIZZERIA * * *
              1) Margherita: £7.50
              2) Bufala: £8.00
              3) Anchovy: £8.00
              4) Pepperoni: £8.50
              5) Calabria: £8.50
              6) Quattro Formaggi: £10.00
              7) Truffle: £12.50
              8) Gold Pizza: £1200.00
              HEREDOC
            )}
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:subject) { Takeaway.new(menu_class) }

  describe "#list_dishes" do
    it 'should list dishes from the initialized menu class' do
      expect(subject.list_dishes).to eq menu.list_dishes
    end
  end
end
