require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { {Margarita: 6.50, Moscow_Mule: 7.15, Gin_and_tonic: 6.00,
                Mojito: 6.79, Daiquiri: 8.21, Old_fashioned: 7.46,
                Bloody_Mary: 6.10, Cosmopolitan: 8.00, Negroni: 6.50,
                Caipirinha: 9, Piña_Colada: 7.60, Gimlet: 6.15,
                Sex_on_the_Beach: 9, White_Russian: 7.80, Aperol_Spritz: 7} }

  describe "#order" do
    it "responds to #order method" do
      expect(order).to respond_to(:order)
    end
  end

  describe "#basket" do
    it "responds to #basket method" do
      expect(order).to respond_to(:basket)
    end
  end

  describe "#checkout" do
    it "responds to #checkout method" do
      expect(order).to respond_to(:checkout)
    end
  end
end
