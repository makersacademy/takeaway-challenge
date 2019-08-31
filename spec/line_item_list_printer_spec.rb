shared_examples 'LineItemListPrinter' do |expected_output, print_method_name|
  let(:menu_item) { instance_double('Takeaway::MenuItem', price: '4.30', to_string: 'Cafe Latte - 4.30') }
  subject         { described_class.new([menu_item, menu_item]) }

  it 'has a default conjoiner of new line' do
    expect(subject.send(print_method_name)).to eq expected_output
  end
end