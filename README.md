# Timelapse
*idea by Nikolai Narma*
*website by Dylan Bowers*

A web application aimed at aiding the time management skills of students and workers alike. Very heavy work in progress. 

**If you'd like to see my current to-do list** (not limited to these, I have a larger extensive list in my mind that I eventually to achieve after writing the basics), check out the 'Issues' tab. Like mentioned, there is much more to be added, but those are the ones currently being worked on now.

### Requirements
 * Rails 4
 * Ruby 2.3+
 * postgres
 * git
 * bundler

### Compiling the environment

First, you'll need to get the gems installed and the database instantiated
```python
bundle install
bundle exec rake db:create #if this fails, try just 'rake db:create'
bundle exec rake db:migrate #if this fails, try just 'rake db:migrate'
```

Then run the server!
```python
rails s
```

### Bugs / Suggestions

Please create an issue under the Issues tab if you want to report a bug or suggest a new feature. Thanks!
