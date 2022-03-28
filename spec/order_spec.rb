require_relative '../lib/order'

describe Order do
  subject(:order) { described_class.new }
  let(:meal_question) { puts "Would you like Italian or French?" }
 
  describe "#my_order" do
    it ' starts as empty my_order array' do
      expect(order.my_order).to be_empty
    end
  end

  describe '#view_menu' do
    it { is_expected.to respond_to(:view_menu) }

    it "prints a list of dishes with prices" do
      expect { order.view_menu }.to output(a_string_including("Tiramisu,  £6" && "Lasagne,  £5")).to_stdout
    end
  end

  describe "add_dish" do
    it { is_expected.to respond_to(:add_dish).with(2).arguments }
    
    it "places one dish in my_order array" do
      order.add_dish('Burrata', 1)
      expect(order.my_order).to eq([{ 'Burrata' => 8 }])
    end

    it "places the correct number of the same dish in my_order" do
      expect { order.add_dish('Salad', 7) }.to change { order.my_order.length }.by(7)
    end

  end

  describe '#view_my_order' do

    it { is_expected.to respond_to(:view_my_order) }

    it "prints out the current order with a total" do
      order.add_dish("Focaccia", 2)
      order.add_dish("Tiramisu", 3)
      expect { order.view_my_order }.to output(a_string_including("Tiramisu,  £6" && "You're total is £26")).to_stdout
    end

  end

  describe "#send_SMS_confirmation" do
    
    it { is_expected.to respond_to(:send_sms_confirmation) }

    xit "sends the user a text to confirm order and delivery time" do
      # expect {order.send_sms_confirmation}.to 
    end

  end

end
