class Topic < ApplicationRecord
  # NHO: probably want to modify this relationship by adding a depedent: :destroy method call
  # to prevent orphaned comment records
  has_many :comments
end
