shared_examples 'Test Helpers' do
  let(:menu_item)   { instance_double('MenuItem', price: '4.30', to_string: 'Cafe Latte - 4.30') }
  let(:time)        { Time.new(1750, 7, 28, 10, 10, 10) }
end