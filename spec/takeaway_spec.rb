require 'takeaway'

describe Takeaway do
  it 'should respond to show menu' do 
    expect(subject).to respond_to(:menu)
  end

  it 'should call display method from Menu' do
    expect(subject.menu).to receive(:show)
    subject.show_menu
  end


end

