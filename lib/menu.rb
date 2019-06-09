require_relative 'menu_entry'

class Menu

  attr_reader :menu, :entry

  def initialize
    @menu = []
  end

  def add_entry(entry)
    @menu << entry.entry
  end
end
