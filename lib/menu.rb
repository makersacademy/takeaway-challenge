#require 'terminal-table'

class Menu

  def initialize
    @list = {margherita: 5, pepperoni: 6, hawaiian: 6, supreme: 7}
  end
  
  attr_reader :list
end
