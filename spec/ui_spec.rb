require 'ui'

describe UI do
  subject(:ui) {UI.new}
  describe '#print_options' do
    it "should print the options" do
      expect(subject.print_options).to eq (['1. Print menu', '2. Add items to basket',
      '3. Checkout', '4. Exit'])
    end
  end

end
