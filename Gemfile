source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', github: 'rails/rails', branch: 'main', ref: '3dd44a7d14af411d98eaddb0921bfe3a0a45c144'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Manage modern JavaScript using ESM without transpiling or bundling
gem 'importmap-rails', '>= 0.3.4'
# Hotwire's SPA-like page accelerator. Read more: https://turbo.hotwired.dev
gem 'turbo-rails', '>= 0.7.11'
# Hotwire's modest JavaScript framework for the HTML you already have. Read more: https://stimulus.hotwired.dev
gem 'stimulus-rails', '>= 0.4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

gem 'cssbundling-rails'


gem "devise", github: "ghiculescu/devise", branch: "patch-2"





# Use Sass to process CSS
# gem "sassc-rails", "~> 2.1"

# Use Active Model has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://github.com/ruby/debug for usage
  gem 'debug', '>= 1.0.0', platforms: %i[mri mingw x64_mingw]
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem 'web-console', '>= 4.1.0'

  # Display speed badge on every html page with SQL times and flame graphs.
  # Note: Interferes with etag cache testing. Can be configured to work on production: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler", "~> 2.0"
  # For memory profiling
  gem 'memory_profiler'
  # For call-stack profiling flamegraphs
  gem 'stackprof'
  # Speed up rails commands in dev on slow machines / big apps. See: https://github.com/rails/spring
  # gem "spring"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
