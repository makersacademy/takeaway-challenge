require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:printed_dishes) {["Fish and Chips; £7.99", "Shephards Pie; £5.99", "Burger; £6.99"]}

  it { is_expected.to respond_to(:dishes) }

  describe "#print" do
    it {is_expected.to respond_to(:print)}
    context "When asked to print" do
      it "prints out the dishes" do
        expect(menu.print).to eq printed_dishes
      end
    end
  end

end
