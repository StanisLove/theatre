namespace :db do
  desc "Prints current schema version"
  task :version => :settings do
    require 'sequel/core'

    version = Sequel.connect(Settings.db.to_hash) do |db|
      if db.tables.include?(:schema_migrations)
        db[:schema_migrations].flat_map(&:values).sort.last
      end
    end

    puts "Schema Version: #{version || 0}"
  end
end
