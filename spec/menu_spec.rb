require 'menu'

describe Menu do
  let(:list) { <<~HEREDOC
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
  }

  describe "#list_dishes" do
    it 'should list a title + the available dishes with their name and price' do
      expect(subject.list_dishes).to eq list
    end
  end
end
