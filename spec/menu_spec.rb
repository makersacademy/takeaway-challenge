require 'menu'

describe '#Print Menu' do
  it 'Should print a list of dishes with relevant prices' do
    (subject.print_menu).to eq "Kebab - £1.00"
  end
end
