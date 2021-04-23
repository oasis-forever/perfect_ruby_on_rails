source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3.1'
# Use Puma as the app server
gem 'puma', '~> 5.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11.2'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.12.1'

gem 'active_storage_validations'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.7.2', require: false

# Error tracking
gem 'rollbar', '~> 3.1.2'

# environmental variables
gem 'dotenv-rails', '~> 2.7.6'

# OAuth
gem 'omniauth', '~> 2.0.3'
gem 'omniauth-github', '~> 2.0.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0.0'

# Locale
gem 'rails-i18n', '~> 6.0.0'

# Pagination
gem 'kaminari', '~> 1.2.1'

# SearchForm
gem 'ransack', '~> 2.4.2'

gem 'rexml', '~> 3.2.4'

group :development, :test do
  # Use mysql as the database for Active Record
  gem 'mysql2', '~> 0.5.3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', "~> 11.1.3", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 4.1.0'
  gem 'listen', '~> 3.4.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'factory_bot_rails', '~> 6.1.0'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.35.3'
  gem 'selenium-webdriver', '~> 3.142.7'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.6.0'
end

group :production do
  gem 'pg', '~> 1.2.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
