require 'selection'

describe Selection do
  let(:dish_name) { "Stew" }
  let(:quantity) { 4 }
  let(:selection) { Selection.new("Stew", 4)}

  it 'set the dish name when you create it' do
    expect(selection.dish_name).to eq(dish_name.to_sym)
  end

  it 'set the dish quantity when you create it' do
    expect(selection.quantity).to eq(quantity)
  end

  context 'argument errors' do
    it 'errors if created with an empty string for the name' do
      expect { Selection.new("", 3) }.to raise_error(ArgumentError, 'selection dish name must not be empty')
    end

    it 'errors if created with a price <= 0' do
      expect { Selection.new("Stew", 0) }.to raise_error(ArgumentError, 'selection quantity must be greater than 0')
    end
  end
end