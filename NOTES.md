# Commands

Commands to help with setting up environment in ruby development

### to install dependencies
```
bundle install

# bundle install bundle config set path 'vendor/bundle'
```
### to run rspec test
```
bundle exec rspec
```

### install Pry
```
gem install pry # main pry gem
```
```
gem install pry-doc # view ruby doc in pry
```

### install byebug
```
gem install byebug
```

before running the file add
```ruby
require "byebug"
```
place this line where you need to debug
```ruby
debugger
```