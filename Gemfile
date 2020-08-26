# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby "2.6.3"

gem 'rake'
gem 'puma'

gem 'sinatra'
gem 'sinatra-contrib'

gem 'i18n'
gem 'config'

gem 'pg'
gem 'sequel'

gem 'dry-initializer'
gem 'dry-validation'

gem 'activesupport', '~> 6.0.0', require: false
gem 'fast_jsonapi'

group :test do
  gem 'rspec'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'database_cleaner-sequel'
end
