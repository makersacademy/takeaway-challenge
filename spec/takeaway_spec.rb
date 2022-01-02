require 'takeaway'

describe Takeaway do
  subject (:takeaway) { Takeaway.new }

  let (:menu) do
    <<~MENU
      Beef burger: 14
      Chicken burger: 12
      Hot dog: 11
      Fries: 4
      Soft drink: 3
      Milkshake: 5
    MENU
  end

  it 'is a takeaway' do
    expect(takeaway).to be_a Takeaway
  end

  describe '#menu' do
    it { is_expected.to respond_to(:menu) }

    it 'shows a menu' do
      allow(takeaway).to receive(:menu) { "Menu" }
      expect(takeaway.menu).to eq "Menu"
    end

    specify { expect { takeaway.menu }.to output(menu).to_stdout }
  end
end
