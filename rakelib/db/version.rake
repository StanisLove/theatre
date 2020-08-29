# frozen_string_literal: true

namespace :db do
  desc 'Prints current schema version'
  task version: :settings do
    require 'sequel/core'

    version = Sequel.connect(Settings.db.to_hash) do |db|
      db[:schema_migrations].flat_map(&:values).max if db.tables.include?(:schema_migrations)
    end

    puts "Schema Version: #{version || 0}"
  end
end
