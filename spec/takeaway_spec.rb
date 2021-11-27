require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {double :menu}
  let(:menu_list) {double("Rice: £3.00, Chicken: £5.00")}
  describe '#menu' do

    #it { is_expected.to respond_to(:print_menu) }
    it "shows a list of dishes with prices" do
        allow(takeaway).to receive(:print_menu).and_return(menu_list)
        expect(takeaway.print_menu).to eq(menu_list)
    end
  end
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

 
