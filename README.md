bizarre_cms
===========

1. Add `bizarre_cms` (currently you must use git source) to your `Gemfile`, then run `bundle`
2. Install gems:

  ```
    rails g active_admin:install
    rails g rich:install
    rails g bizarre_cms:install
    rake db:migrate
    rm app/assets/javascripts/rich.js #bizarre_cms will handle it

3. Add to active_admin.js:

  ```
    //= require bizarre_cms

4. Add to active_admin.css.scss:

  ```
    @import 'bizarre_cms'
