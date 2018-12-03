class InsurancePlan < ApplicationRecord
  # Direct associations

  has_many   :comparison_tables,
             :dependent => :nullify

  has_many   :user_plans,
             :class_name => "InterestedPlan",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
