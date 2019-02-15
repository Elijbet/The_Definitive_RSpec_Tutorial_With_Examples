## We are going to write a simple application that finds factorial numbers.

Follow the spec file for commented explanations. 

-------------------------------

### How to run a single RSpec test?


rspec ./spec/controllers/groups_controller_spec.rb:42

Where 42 represents the line of the test I want to run.


### create method in Rspec

example 

create(:practice, creator: create(:physician, password: "password123", password_confirmation: "password123" ), phone: "+1 (555) 555-5554", office: "+1 (555) 555-5555", clinic_key: "abc123")

It looks like create is called from FactoryBot.

Usually you need to create object like FactoryBot.create(:user) but if you configure factory bot

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

you can omit FactoryBot and use short variant create(:user).

So the example code creates factory practice with creator which is created by another factory physician.

### rspec tables are empty

RAILS_ENV=test rake db:schema:load

