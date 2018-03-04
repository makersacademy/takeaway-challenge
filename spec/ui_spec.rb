require 'ui'

describe UI do
  subject(:ui) {UI.new(fake_menu)}
  let(:fake_menu) { double print: ["Salad: 20"] }
  describe '#print_options' do
    it "should print the options" do
      expect(subject.print_options).to eq (['1. Print menu', '2. Add items to basket',
      '3. Checkout', '4. Exit'])
    end
  end

  describe '#print_menu' do
    it "should call on menu to print" do
      expect(subject.print_menu).to eq (["Salad: 20"])
    end
  end


end
