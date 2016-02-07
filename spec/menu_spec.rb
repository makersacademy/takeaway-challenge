require 'menu'

describe Menu do

  let(:items) {{orange: 1, noodles: 10, pie: 6}}
  let(:message) {"No menu here yet!"}
  let(:new_menu) {described_class.new}
  subject(:menu) {described_class.new}

  it{is_expected.to respond_to(:list_items)}
  it{is_expected.to respond_to(:change_menu)}

  it 'returns an "empty" message until menu is set' do
    expect(subject.list_items).to eql message
  end

  it 'allows a change of menu' do
    subject.change_menu items
    expect(subject.list_items).to eql items
  end

end
