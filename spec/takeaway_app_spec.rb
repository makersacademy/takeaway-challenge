require 'takeaway_app'

describe TakeawayApp do
 
  let(:menu) { double(:menu, print: 'Menu List') }  
  let(:dish1) { double(:dish, name: "Korma", price: 5.00) }
  let(:dish2) { double(:dish, name: "Jalfrezi", price: 6.99) }
  let(:twilio) { double(:twilio_sender, send_text: "text sent") }
  let(:app) { TakeawayApp.new(menu, twilio) }

  describe "#view_dishes" do

    it "is expected to show dishes on the menu" do #me
     
      expect{ app.view_dishes }.to output("Menu List\n").to_stdout
      
    end

  end

  describe "#add_dish" do
    
    it "should add number of dishes from menu to basket" do
      
      chillis = []
      5.times { chillis << "Chilli" }
      allow(menu).to receive(:release).with("Chilli", 5).and_return(chillis)
      app.add_dish("Chilli", 5)
      expect(app.basket).to include("Chilli").at_least(5).times

    end

  end

  describe "#view_basket" do
    
    it "should show dishes in basket, and the total" do

      app.basket << dish1
      app.basket << dish2
      expect{ app.view_basket }.to output("Korma: £5.0 \nJalfrezi: £6.99 \nTotal: £11.99\n").to_stdout

    end

  end

  describe "#confirm_order" do
    
    it "should send a text confirmation" do
      expect(app.confirm_order).to eq "text sent"
    end

  end

end