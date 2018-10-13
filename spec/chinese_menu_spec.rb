require 'chinese_menu'

describe ChineseMenu do
  let(:list) { <<~HEREDOC
               * * * STREET * CHINESE * * *
               1) Dandan Noodles: £3.00
               2) Liang Pi: £3.00
               3) Baozi: £5.00
               4) Chilli Tofu: £5.00
               5) Stir Fried Pork: £6.50
               6) Satay Chicken: £7.00
               7) Peking Duck: £45.00
               8) Gold Peking Duck: £1500.00
               HEREDOC
  }
  let(:unformatted) {
    [
      { "Dandan Noodles" => 3 },
      { "Liang Pi" => 3 },
      { "Baozi" => 5 },
      { "Chilli Tofu" => 5 },
      { "Stir Fried Pork" => 6.5 },
      { "Satay Chicken" => 7 },
      { "Peking Duck" => 45 },
      { "Gold Peking Duck" => 1500 }
    ]
  }

  describe "#list_dishes" do
    it 'should list a title + the available dishes with their name and price' do
      expect(subject.list_dishes).to eq list
    end
  end

  describe "#dishes" do
    it 'should have a list of dishes that can be viewed unformatted' do
      expect(subject.dishes).to eq unformatted
    end
  end
end
