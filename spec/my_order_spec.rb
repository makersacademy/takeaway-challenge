require_relative '../lib/my_order'

describe UberEatz do
  subject(:ubereatz) { described_class.new }
  let(:meal_question) { puts "Would you like Italian or French?" }
 
  describe "#my_order" do
    it ' starts as empty my_order array' do
      expect(ubereatz.my_order).to be_empty
    end
  end

  describe "#ask_what_menu" do
    xit 'sends a prompt question to output' do
      output = StringIO.new
      ubereatz = UberEatz.new(output: output)
      ubereatz.ask_what_menu
      expect(output.string).to include(meal_question)
    end
  end

  # it "asks the user to choose a cuisine" do
  #   my_order
  #   expect{ meal_question }.to output("Would you like Italian or French?").to_stdout
  # end

  describe '#view_menu' do
    let(:digital_menu) { "Focaccia,  £4\nBurrata,  £8\nSalad,  £5\nBrusscetta,  £5\nSalami,  £6\nLasagne,  £5\nPizza Margheritta,  £10\nArrabiata,  £10\nPenne a la Vodka,  £12\nCanelloni,  £15\nPumpkin Ravioli,  £12\nEggplant Parmigiana,  £13\nSpaghetti Puttanesca,  £10\nPenne Pomodoro,  £9\nTiramisu,  £6\nAfogato,  £7\n" }
    it { is_expected.to respond_to(:view_menu) }

    it "prints a list of dishes with prices" do
      expect { ubereatz.view_menu }.to output(digital_menu).to_stdout
    end
  end

  describe "add_dish" do
    it { is_expected.to respond_to(:add_dish).with(2).arguments }
    
    it "places one dish in my_order array" do
      ubereatz.add_dish('Burrata', 1)
      expect(ubereatz.my_order).to eq([{ 'Burrata' => 8 }])
    end

    it "places the correct number of the same dish in my_order" do
      expect { ubereatz.add_dish('Salad', 7) }.to change { ubereatz.my_order.length }.by(7)
    end

    it "doesn't let you order things that aren't on the menu" do
      expect { ubereatz.add_dish("Ben and Jerrys", 1) }.to raise_error "Sorry, thats not on the menu"
    end
  end

  describe '#view_my_order' do

    it { is_expected.to respond_to(:view_my_order) }

    it "prints out the current order with a total" do
      ubereatz.add_dish("Focaccia", 2)
      ubereatz.add_dish("Tiramisu", 3)
      expect { ubereatz.view_my_order }.to output(a_string_including("Tiramisu,  £6\nYou're total is £26")).to_stdout
    end

    it "will raise an error if my_order is empty" do
      expect { ubereatz.view_my_order }.to raise_error "You haven't chosen anything yet"
    end


  end
end

  # now a private method 

#   describe "total" do
#     before(:each) do
#       ubereatz.add_dish("Canelloni", 2)
#       ubereatz.add_dish("Arrabiata", 3)
#     end

#     it "adds the dishes prices up" do
#       expect(ubereatz.total).to eq((2*15) + (3*10))
#     end
#   end

