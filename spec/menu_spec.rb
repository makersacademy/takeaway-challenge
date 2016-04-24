require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:menu_actual) { double(:dish, name: :chiken_foo_young, price: 4) }

  describe '#initialize' do
    it "displays the name of the dishes" do
      expect(subject.display_menu).to include :chiken_foo_young
    end
  end
end
