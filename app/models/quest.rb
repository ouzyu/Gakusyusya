class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :ability
  belongs_to :actor
  belongs_to :map
end
