# frozen_string_literal: true

namespace :db do
  desc 'Run database migrations'
  task migrate: :settings do
    require 'sequel/core'

    # Create blank task to avoid error
    ARGV.each { |a| task a.to_sym do; end }

    version    = ARGV[1]&.to_i
    migrations = File.expand_path('../../db/migrations', __dir__)

    Sequel.extension :migration

    Sequel.connect(Settings.db.to_hash) do |db|
      Sequel::Migrator.run(db, migrations, target: version)
    end
    Rake::Task['db:version'].execute
  end
end
