namespace :db do
  desc "Prints current schema version"
  task :version => :settings do
    require 'sequel'

    version = Sequel.connect(Settings.db.to_hash) do |db|
      db[:schema_migrations].first[:filename] if db.tables.include?(:schema_migrations)
    end

    puts "Schema Version: #{version || 0}"
  end
end
