require 'takeaway'

describe Takeaway do


describe '#print_menu'do
  it 'prints menu items' do
    #expect(subject).to respond_to(:print_menu)
    expect(subject.print_menu).to eq ('menu')
  end

end
end
