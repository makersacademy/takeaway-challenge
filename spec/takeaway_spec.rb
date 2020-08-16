require 'takeaway'

describe Takeaway do

  before do
    @list = Menu.new
    subject.place_order
  end

  it 'basic instance creation' do
    expect(subject).to be_instance_of(Takeaway)
  end

  it 'responds to menu inst var' do
    expect(subject).to respond_to(:menu)
  end

  it 'responds to start method' do
    expect(subject).to respond_to(:place_order)
  end

  it 'allows customer to view order' do
    expect(subject).to respond_to(:view_order)
  end
  
  # describe 'view_order' do

  #  it 'successfully calls basket on Order instance' do
  #    expect(subject.view_order).to respond_to(:total)
  #  end

  #end

  it 'responds to finish method' do
    expect(subject).to respond_to(:finish_order)
  end

  it 'responds to finish method' do
    expect(subject).to respond_to(:view_menu)
  end

  describe 'view_menu' do

    it 'returns a list of dishes when called' do
      expect(subject.view_menu).to eq @list.customer_view
    end

  end

end
