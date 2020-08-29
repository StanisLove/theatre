# frozen_string_literal: true

namespace :db do
  namespace :generate do
    desc 'Generate database migration.'
    task :migration do
      require 'active_support/core_ext/string/inflections'

      # Create blank task to avoid error
      ARGV.each { |a| task a.to_sym do; end }

      name = ARGV[1]

      abort 'Provide a migration name please.' unless name

      timestamp  = Time.now.utc.strftime('%Y%m%d%H%M%S')
      migrations = File.expand_path('../../db/migrations', __dir__)
      filename   = File.join(migrations, "#{timestamp}_#{name.underscore}.rb")

      File.open(filename, 'w') do |file|
        file.write(<<~TEXT)
          Sequel.migration do
            change do
            end
          end
        TEXT
      end
    end
  end
end
