require 'pizzeria_menu'

describe PizzeriaMenu do
  let(:list) { <<~HEREDOC
              * * * PAPA'S * PIZZERIA * * *
              1) Margherita: £7.50
              2) Bufala: £8.00
              3) Anchovy: £8.00
              4) Pepperoni: £8.50
              5) Calabria: £8.50
              6) Quattro Formaggio: £10.00
              7) Truffle: £12.50
              8) Gold Pizza: £1200.00
              HEREDOC
  }
  let(:unformatted) {
    [
      { "Margherita" => 7.5 },
      { "Bufala" => 8 },
      { "Anchovy" => 8 },
      { "Pepperoni" => 8.5 },
      { "Calabria" => 8.5 },
      { "Quattro Formaggio" => 10 },
      { "Truffle" => 12.5 },
      { "Gold Pizza" => 1200 }
    ]
  }

  describe "#list_dishes" do
    it 'should list a title + the available dishes with their name and price' do
      expect { subject.list_dishes }.to output(list).to_stdout
    end
  end

  describe "#dishes" do
    it 'should have a list of dishes that can be viewed unformatted' do
      expect(subject.dishes).to eq unformatted
    end
  end
end
