require 'menu'

describe Menu do
  let(:fake_menu) { double 'fake_menu' }
  let(:fake_printer_class) { double 'fake_printer_class' }
  subject(:subject) { described_class.new(fake_printer_class)}

  it 'Should initialize with menu array' do
    expect(subject.menu).to eq [
      { item: "Devil's Cauliflower", price: 4 },
      { item: "Rainbow Pot", price: 3 },
      { item: "Oreo Brownie", price: 3 },
    ]
  end

  describe '#display_menu' do

    it 'Should call print method with menu parameter' do
        allow(fake_printer_class).to receive(:formatter).with(fake_menu) do
          subject.display_menu(fake_menu)
          expect(fake_printer_class).to receive(:formatter).with(fake_menu)
        end
    end
  end

  # describe '#start_order' do
  #
  #   it 'Should return true to begin order' do
  #     expect(subject.start_order).to eq true
  #   end
  # end
end
