require 'rails_helper'

RSpec.describe InsurancePlan, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comparison_tables) }

    it { should have_many(:user_plans) }

    end

    describe "InDirect Associations" do

    it { should have_many(:applicants) }

    it { should have_many(:users) }

    end

    describe "Validations" do
      
    end
end
