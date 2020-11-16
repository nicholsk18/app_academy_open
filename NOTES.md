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

## Useful notes

### setting up getters & setters
Use ```attr_reader``` to init getters.

Ex:
```ruby
class Dog
  # attr_reader will define #name and #age getters for us
  attr_reader :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end
```
```:name``` and ```:age``` will be accessible from outside the class as a getter.

Use ```attr_writer``` to init setters

Ex:
```ruby
class Dog
  # attr_writer will define #name= and #age= setters for us
  attr_writer :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end
```
```:name``` and ```:age``` will be accessible from outside the class as a setters.

To set up both use ```attr_accessor``` and the variables will be available as getters and setters.

```ruby
class Dog
  # attr_accessor will define #name, #name=, #age, #age= methods for us
  attr_accessor :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end
```
```:name``` and ```:age``` will be accessible from outside the class as a getter and setters.