require_relative './menu.rb'
require 'forwardable'

class Takeaway

  extend Forwardable

  def_delegators :@menu, :viewmenu, :order

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

end
