# frozen_string_literal: true

desc 'Task to load app Settings'
task :settings do
  require 'config'
  require_relative '../config/initializers/config'
end
