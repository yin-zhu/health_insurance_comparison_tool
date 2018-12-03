class InterestedPlan < ApplicationRecord
  # Direct associations

  belongs_to :insurance_plan

  belongs_to :user

  # Indirect associations

  # Validations

end
