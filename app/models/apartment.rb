class Apartment < ApplicationRecord
  belongs_to :user

  resourcify #this is the resource that can be managed based on roles
end
