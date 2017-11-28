class User
  include ActiveModel::Model
  attr_accessor :credit_card
  attr_writer   :subscription

  delegate :has_mentoring?, :price, to: :subscription

  def charge
    subscription.charge(credit_card)
  end

  def subscription
    @subscription ||= NullSubscription.new
  end
end
