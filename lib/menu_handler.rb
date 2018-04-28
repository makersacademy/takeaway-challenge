require 'csv'
require 'find'

class Menu_handler

  attr_reader :files

  ROOT = '/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/resources/menus/'

  def initialize(root = ROOT)
    @root = root
    @files = get_files
  end

  def get_summaries

  end


  private

  def get_files
    csv_files = []
    Find.find(@root) do |path|
      csv_files << path if path =~ /.*\.csv$/
    end
    csv_files
  end

end
