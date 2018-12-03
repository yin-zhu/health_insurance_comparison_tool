class InsurancePlan < ApplicationRecord
  # Direct associations

  has_many   :comparison_tables,
             :dependent => :nullify

  has_many   :user_plans,
             :class_name => "InterestedPlan",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :comparison_tables,
             :source => :user

  # Validations

end
