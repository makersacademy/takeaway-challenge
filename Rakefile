require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec

task default: [:spec]

require 'dotenv/tasks'

task :mytask => :dotenv do
    # things that require .env
end
