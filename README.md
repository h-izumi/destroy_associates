# DestroyAssociates

Destroy association if specified attribute is blank.

## Installation

Add this line to your application's Gemfile:

    gem 'destroy_associates'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install destroy_associates

## Usage

Add "destroy_associates_if_blank" to model.

```ruby
class User < ActiveRecord::Base
  has_many :mails
  accepts_nested_attributes_for :mails

  destroy_associates_if_blank :mails, :address
end

class Mail < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address
end
```

```ruby
user.mails
=> [<Mail id: 1, user_id: 1, address: "alice@example.inc">]

user.mails.first.address = ""
user.save!

user.mails
=> []
```

## License
This gem is released under the MIT license.

## Contributing

1. Fork it ( http://github.com/h-izumi/destroy_associates/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
