# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.6.3'

gem 'puma'
gem 'rake'

gem 'sinatra'
gem 'sinatra-contrib'

gem 'config'
gem 'i18n'

gem 'pg'
gem 'sequel'

gem 'dry-monads'
gem 'dry-validation'

gem 'activesupport', '~> 6.0.0', require: false
gem 'fast_jsonapi'

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
end

group :test do
  gem 'database_cleaner-sequel'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'rspec'
end
