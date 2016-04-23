require 'takeaway'

describe Takeaway do
  let (:menu_instance) {double :menu_instance}

  it{is_expected.to respond_to(:read_menu)}

  it 'should be able to read a menu' do
    allow(menu_instance).to receive(:new).and_return(menu_instance)
    expect(menu_instance).to receive(:read).and_return(menu_instance)
    subject.read_menu(menu_instance)
  end

end
