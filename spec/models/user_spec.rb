require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:user_plans) }

    end

    describe "InDirect Associations" do

    it { should have_many(:interested_plans) }

    end

    describe "Validations" do
      
    end
end
