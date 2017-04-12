require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have an email and a password" do
    mrin = User.new(email: "mrin@sin.com", password: "mrinsin", password_confirmation: "mrinsin")

    expect(mrin.save).to be true
  end
end
