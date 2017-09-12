require 'takeaway'
describe Takeaway do
  let(:takeaway) { Takeaway.new}
  let(:menu_list) { {'Pierogi' => 5.50,
  'Black_pudding' => 12} }


  it 'should show a list of dishes' do
    is_expected.to respond_to(:read)
  end
  it 'should give us a list of dishes' do
    expect(takeaway.read).to eq menu_list
  end

end
