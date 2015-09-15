require 'menu'

describe Menu do

  let(:dish1) { double(:dish1, name: "Dishy1", price: 1.11) }
  let(:dish2) { double(:dish2, name: "Dishy2", price: 2.22) }
  let(:dish3) { double(:dish3, name: "Dishy3", price: 3.33) }
  let(:dish_decimal) { double(:dish4, name: "Dishy4", price: 5.00) }

  describe '#make_dish_available' do
    it 'adds a new dish to the menu' do
      subject.make_dish_available(dish1)
      expect(subject.menu.values.include?(dish1)).to be true
    end
  end

  describe '#view' do
    it 'lists dishes available with price' do
      subject.make_dish_available(dish1)
      expected_output = "1: Dishy1 | Price: £1.11\n"
      expect{ subject.view }.to output(expected_output).to_stdout
    end

    it 'lists multiple dishes with unique order numbers' do
      subject.make_dish_available(dish1)
      subject.make_dish_available(dish2)
      subject.make_dish_available(dish3)
      expected_output = "1: Dishy1 | Price: £1.11\n\
                        2: Dishy2 | Price: £2.22\n\
                        3: Dishy3 | Price: £3.33\n"
      expect{ subject.view }.to output(expected_output).to_stdout
    end

    it 'raises an error if no dishes available' do
      error_msg = "No dishes available on this menu"
      expect{ subject.view }.to raise_error error_msg
    end

    it 'displays prices to 2 decimal places' do
      expected_output = "1: Dishy4 | Price: £5.00\n"
      subject.make_dish_available(dish_decimal)
      expect{ subject.view }.to output(expected_output).to_stdout
    end
  end

  describe '#select' do
    it 'returns the selected dish given the corresponding menu number' do
      subject.make_dish_available(dish1)
      subject.make_dish_available(dish2)
      subject.make_dish_available(dish3)
      expect( subject.select(2) ).to eq dish2
    end

    it 'raises an error if no dishes have been added' do
      error_msg = "No dishes available on this menu"
      expect{ subject.select(1) }.to raise_error error_msg
    end

    it 'raises an error if order number isn\'t listed' do
      subject.make_dish_available(dish1)
      error_msg = "There are no dishes matching the number given"
      expect{ subject.select(2) }.to raise_error error_msg
    end
  end

end
