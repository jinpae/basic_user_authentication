## Basic User Authentication with Bcrypt
This is a Ruby on Rails 4.2 application that provides and demonstrates simple user authentication.

In order to review and solidify my foundation on how the general authentication process works and is implemented in Rails, I decided not to use any authentication related gems such as [Devise](https://github.com/plataformatec/devise) and [Authlogic](https://github.com/binarylogic/authlogic), but pretty much build it from scratch just using bcrypt for encrypting user passwords.

Check out the [live demo](https://secret-headland-7231.herokuapp.com/)

The app is built using:
* Ruby 2.0.0p598
* Rails 4.2.0
* Bcrypt
* [Bootstrap-sass](https://github.com/twbs/bootstrap-sass)
* [Bourbon](http://bourbon.io/)
* [Mandrill](http://mandrill.com/)

## Implemented Features
* Welcome page
* Navigation bar
* Sign up
* Sign in/out
* "Remember me" feature
* "Forgot your password?" feature

## Running it locally
If you would like to run the app locally on your machine, follow the steps below.

1. In the command line, run `git clone` to clone the repo.

  `git clone git@github.com:jinpae/basic_user_authentication.git`

2. Change directory to the cloned repo and run `bundle install` to download and install any necessary gems to run the app.

3. Run `rake db:migrate` to migrate the database.

4. Rename `secrets.yml.example` file found under `config` directory to `secrets.yml`

5. By default, the app is configured to use [Mandrill](http://mandrill.com/) for sending emails, but you could change it to use other email infrastructure services or simply use your personal test account you already have (e.g., Gmail account). All you need to do is to update the stmp settings found in `development.rb` file under `config/environments` directory:

  ```
  config.action_mailer.smtp_settings = {
    port: '587',
    address: 'smtp.mandrillapp.com',
    user_name: Rails.application.secrets.mandrill_username,
    password: Rails.application.secrets.mandrill_apikey,
    domain: 'example.com',
    authentication: :plain,
    enable_starttls_auto: true
  }
  ```
  
  Change above section accordingly to reflect your needs. You might want to update your `secrets.yml` file as well.
  
## License
MIT Lecense

Copyright &copy;2015 Jin Pae
