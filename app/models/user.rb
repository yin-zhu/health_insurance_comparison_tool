class User < ApplicationRecord
  # Direct associations

  has_many   :comparison_tables,
             :dependent => :destroy

  has_many   :user_plans,
             :class_name => "InterestedPlan",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
