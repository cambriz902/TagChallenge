# README

This is a generic Tagging JSON API that can store, retrieve, delete and report on the usage of a "tag" across different entities. 

Additional information can be found at [https://gist.github.com/dradford/9407c8c6af5ea3469596].

## Data Model

### Implementation

I implemented the tags association to entities using polymorphism. This allows a developer to associate many different models to a single model by saving the entity_type and entity_id. Using this methods adds a little bit more code since you have to convert the entity_type to the correct model before using entity_id to find the specific field. But, it allows you to associate as many different models and new models very easily.

I created a Tag model with `belongs_to :taggable, polymorphic: true`. I also created two models for testing a Product model with `has_many :tags, as: :taggable, dependent: :destroy` and Article model with `has_many :tags, as: :taggable, dependent: :destroy`.

### Considered
Another way of doing this is to create an index association for every model that can have a tag(ex: product_id, article_id) and check which one of the fields is not nil. The problem with this is that it doesn't scale very well since you need a field for each model associated with tags. 

## Controllers

### Implementation

I create two controllers. The Tags controller handles the creation of tags and their entity associations. The Stats controller will handle all the actions that have to deal with getting Stats data. Stats and Tags address two different concerns and therefore should be seperated.

I decided to write sql in the stats_controller.rb since the query was more complicated and I didn't want to make multiple requests to the database.

## Routes
I like to have my api directory set up as controllers/api/v#{version}/. This makes it easier to keep different api versions and allow users to stay on an older version when a new version is released. This helps people using your api update their code so nothing breaks before updating to the new version.

## Test
I used TDD while building this application. To run all test clone repo run bundle install and run the command rspec.

## Gems

```ruby
gem 'annotate'
```
Adds a comment summarizing the current schema to the top or bottom of different files.
```ruby
gem 'active_model_serializers', git: 'git@github.com:rails-api/active_model_serializers.git', branch: '0-8-stable'
```
Adds configuration to your JSON generation.
```ruby
gem 'rspec-rails', '3.1.0'
```
Testing Framework.
```ruby
gem 'factory_girl_rails'
```
Adds fixture replacements with a straightforward definition syntax.
```ruby
gem 'shoulda-matchers', '~3.1.0'
```
Provides RSpec- and Minitest-compatible one-liners that test common Rails functionality.
```ruby
gem 'rspec-collection_matchers'
```
Lets you express expected outcomes on collections of an object in an example.
