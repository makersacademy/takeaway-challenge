require 'csv'
require 'find'

class Menu_handler

  attr_reader :file_summaries

  ROOT = '/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/resources/menus/'

  def initialize(root = ROOT)
    @root = root
    @file_summaries = []
  end

  def get_summaries
    get_files.each do |file_path|
      load_summaries(file_path)
    end
  end

  def get_items(category)


  end

  private

  def get_files
    csv_files = []
    Find.find(@root) do |path|
      csv_files << path if path =~ /.*\.csv$/
    end
    csv_files
  end

  def load_summaries(filepath)
    CSV.open(filepath) do |csv|
      flag, category, summary = csv.first
      if flag == "Description"
      @file_summaries << { path: filepath,
                           summary: summary,
                           category: category
                         }
      end
    end
  end

end
