require 'restaurant'

describe Restaurant do
  let(:oki) {Restaurant.new('oki')}

  describe "#check_menu" do
    it "Consumer can check the menu list with prices" do
      expect(oki.display_menu).to eq ({ :soup => 6.0,
                                       :meat => 10.0,
                                       :chicken => 8.0,
                                       :yaksoba => 7.0,
                                       :rice => 3.0,
                                       :coke => 2.0,
                                       :juice => 2.0,
                                       :beer => 1.5,
                                       :wine => 6.0 })

    end
  end
end