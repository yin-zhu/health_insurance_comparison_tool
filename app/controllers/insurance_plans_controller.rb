class InsurancePlansController < ApplicationController
  def index
    @q = InsurancePlan.ransack(params[:q])
    @insurance_plans = @q.result(:distinct => true).includes(:user_plans, :comparison_tables, :users, :applicants).page(params[:page]).per(10)

    render("insurance_plan_templates/index.html.erb")
  end

  def show
    @comparison_table = ComparisonTable.new
    @interested_plan = InterestedPlan.new
    @insurance_plan = InsurancePlan.find(params.fetch("id_to_display"))

    render("insurance_plan_templates/show.html.erb")
  end

  def new_form
    @insurance_plan = InsurancePlan.new

    render("insurance_plan_templates/new_form.html.erb")
  end

  def create_row
    @insurance_plan = InsurancePlan.new

    @insurance_plan.coinsurance_paid_by_patient = params.fetch("coinsurance_paid_by_patient")
    @insurance_plan.deductible = params.fetch("deductible")
    @insurance_plan.monthly_premium = params.fetch("monthly_premium")
    @insurance_plan.plan_name = params.fetch("plan_name")
    @insurance_plan.comp_table_id = params.fetch("comp_table_id")
    @insurance_plan.age_group = params.fetch("age_group")

    if @insurance_plan.valid?
      @insurance_plan.save

      redirect_back(:fallback_location => "/insurance_plans", :notice => "Insurance plan created successfully.")
    else
      render("insurance_plan_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @insurance_plan = InsurancePlan.find(params.fetch("prefill_with_id"))

    render("insurance_plan_templates/edit_form.html.erb")
  end

  def update_row
    @insurance_plan = InsurancePlan.find(params.fetch("id_to_modify"))

    @insurance_plan.coinsurance_paid_by_patient = params.fetch("coinsurance_paid_by_patient")
    @insurance_plan.deductible = params.fetch("deductible")
    @insurance_plan.monthly_premium = params.fetch("monthly_premium")
    @insurance_plan.plan_name = params.fetch("plan_name")
    @insurance_plan.comp_table_id = params.fetch("comp_table_id")
    @insurance_plan.age_group = params.fetch("age_group")

    if @insurance_plan.valid?
      @insurance_plan.save

      redirect_to("/insurance_plans/#{@insurance_plan.id}", :notice => "Insurance plan updated successfully.")
    else
      render("insurance_plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @insurance_plan = InsurancePlan.find(params.fetch("id_to_remove"))

    @insurance_plan.destroy

    redirect_to("/insurance_plans", :notice => "Insurance plan deleted successfully.")
  end
end
