# Upcase Refactoring Trail

## Null Object (Part 1)

Refactoring exercise using the [Introduce Null Object](https://refactoring.com/catalog/introduceNullObject.html) refactoring for the [Upcase Refactoring Trail](https://thoughtbot.com/upcase/refactoring).

### Null Object

> You have repeated checks for a null value. Replace the null value with a null object. -- Martin Fowler

#### Before

```ruby
# user.rb

class User
  include ActiveModel::Model
  attr_accessor :credit_card, :subscription

  def charge
    unless subscription.nil?
      subscription.charge(credit_card)
    end
  end

  def has_mentoring?
    subscription && subscription.has_mentoring?
  end

  def price
    subscription.try(:price) || 0
  end
end
```

#### After

```ruby
# user.rb

class User
  include ActiveModel::Model
  attr_accessor :credit_card
  attr_writer   :subscription

  delegate :has_mentoring?, :price, to: :subscription

  def charge
    subscription.charge(credit_card)
  end

  def subscription
    @subscription ||= NoSubscription.new
  end
end
```

```ruby
# no_subscription.rb

class NoSubscription
  def has_mentoring?
    false
  end

  def charge(_credit_card)
    false
  end

  def price
    0
  end
end
```
