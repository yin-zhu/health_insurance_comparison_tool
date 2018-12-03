class ComparisonTable < ApplicationRecord
  # Direct associations

  belongs_to :insurance_plan

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
