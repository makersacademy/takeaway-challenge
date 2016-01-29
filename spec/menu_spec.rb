require 'menu'

describe Menu do

  let(:items) {{orange: 1, noodles: 10, pie: 6}}
  let(:message) {"No menu here yet!"}
  let(:new_menu) {described_class.new}
  subject(:menu) {described_class.new items}

  it{is_expected.to respond_to(:list_items)}
  it{is_expected.to respond_to(:change_menu)}

  it 'returns an "empty" message until menu is set' do
    expect(new_menu.list_items).to eql message
  end

end
