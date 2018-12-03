require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:comparison_tables) }

    it { should have_many(:user_plans) }

    end

    describe "InDirect Associations" do

    it { should have_many(:interested_plans) }

    it { should have_many(:comp_plans) }

    end

    describe "Validations" do
      
    end
end
