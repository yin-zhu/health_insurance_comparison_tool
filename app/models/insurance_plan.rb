class InsurancePlan < ApplicationRecord
  # Direct associations

  has_many   :user_plans,
             :class_name => "InterestedPlan",
             :dependent => :destroy

  # Indirect associations

  has_many   :applicants,
             :through => :user_plans,
             :source => :user

  # Validations

end
