require 'order'

describe Order do

  it { is_expected.to respond_to(:add_order).with(1).argument }

  # it 'selects a number of dishes' do
  #   dishes = { the_pan_galactic_gargle_blaster: 314159, darlas_dirty_rice: 2 }
  #   expect(subject.add_order(dishes)).to eq dishes
  # end

end
