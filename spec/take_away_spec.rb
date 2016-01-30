
require './lib/take_away.rb'

describe TakeAway do
  subject(:take_away) { described_class.new }

  describe "#show_menu" do

    it { is_expected.to respond_to :show_menu}

    it "returns a menu" do
      expect { take_away.show_menu }.to output(
"                       MENU

              COMBINATIE MENU'S met rijst

 1  BABI PANGANG / Koe loe kai                     € 11,90
 2  BABI PANGANG / Tjap tjoy kip                   € 11,70
 3  BABI PANGANG / Foe yong hai kip                € 11,70
 4  BABI PANGANG / Kip met Kerrie saus             € 12,00
 5  BABI PANGANG / Kip met zoete Peking saus       € 12,00
 6  FOE YONG HAI / Tjap tjoy kip                   € 11,00
 7  FOE YONG HAI / Koe loe kai                     € 11,70
 8  FOE YONG HAI / Krokante kip met zoetzure saus  € 12,00

                   SOEP & SALADES

 9  MAISSOEP met krab en kip                       €  3,20
10  KIPPENSOEP                                     €  2,30
11  TOMATENSOEP met kip                            €  2,50
12  SICHUAN SOEP (pikant-zuur)                     €  4,00
13  WAN TAN SOEP                                   €  3,80
14  JAPANSE MISO SOEP                              €  2,30
15  MAIS SALADE                                    €  2,50
16  KRAB SALADE                                    €  2,50
17  ZEEWIER SALADE                                 €  2,50
18  TONIJN SALADE                                  €  2,50
19  ZURE KOMKOMMER                                 €  2,50
").to_stdout
    end
  end
end
