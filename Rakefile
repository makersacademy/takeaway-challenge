require 'rspec/core/rake_task'
require 'dotenv/tasks'

task :mytask => :dotenv do
    # things that require .env
end

RSpec::Core::RakeTask.new :spec

task default: [:spec]
