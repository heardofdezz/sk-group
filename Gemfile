source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'autoprefixer-rails'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap_form',
    git: 'https://github.com/bootstrap-ruby/rails-bootstrap-forms.git',
    branch: 'master'
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'rails', '~> 5.2.0'
# gem 'sprockets-rails', require: 'sprockets/railtie' # Allan
# gem 'bootstrap-sass', '~> 3.3.7'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails'
gem 'puma', '~> 4.3' # Use Puma as the app server
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
# gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application fast
# gem 'redis', '~> 3.0' # Use Redis adapter to run Action Cable in production
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'pg'
end

group :test do
  gem 'faker'
  gem 'shoulda'
end

group :development do
  gem "rails-erd"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0' # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'factory_bot' # or #gem 'factory_girl'
  gem 'selenium-webdriver'
  gem 'sqlite3' # Use sqlite3 as the database for Active Recor
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
