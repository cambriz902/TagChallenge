source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# annotate columns to model file
gem 'annotate'
# serializers
gem 'active_model_serializers', git: 'git@github.com:rails-api/active_model_serializers.git', branch: '0-8-stable'

gem 'responders'
group :development, :test do
  gem 'pry'
  # use RSpec for specs
  gem 'rspec-rails', '3.1.0'
  # Use Factory Girl for generating test data
  gem 'factory_girl_rails'
  # rpsec syntax
  gem 'shoulda-matchers', '~> 3.1.0'
  # rspec syntax
  gem 'rspec-collection_matchers'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
