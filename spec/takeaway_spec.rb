#!/usr/bin/env ruby

require 'takeaway'

describe TakeAway do

  let(:menu_class) { double(menu_class, from_csv: menu) }
  let(:order_class) { double(order_class, from_selection: order) }
  let(:parser) { double(:parser) }

  let(:takeaway) do
    described_class.new(menu_location: 'path', menu_class: menu_class,
                        parser: parser, order_class: order_class
                       )
  end

  describe '#initialize' do
  end
end
