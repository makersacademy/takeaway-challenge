require 'rspec/core/rake_task'
require 'dotenv/tasks'

RSpec::Core::RakeTask.new :spec

task default: [:spec]

task mytask: :dotenv do
    Takeaway.new :send_confirmation
end
