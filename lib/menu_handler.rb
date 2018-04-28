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
    summaries = []
    @files.each do |file_path|
      summaries << read_summary(file_path) if !read_summary(file_path).nil?
    end
    summaries
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

  def read_summary(filepath)
    CSV.open(filepath) do |csv|
      flag, category, summary = csv.first
      return { category: category, summary: summary } if flag == "Description"
    end
  end

end
