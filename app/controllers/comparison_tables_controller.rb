class ComparisonTablesController < ApplicationController
  before_action :current_user_must_be_comparison_table_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_comparison_table_user
    comparison_table = ComparisonTable.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == comparison_table.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.comparison_tables.ransack(params[:q])
    @comparison_tables = @q.result(:distinct => true).includes(:user, :insurance_plan).page(params[:page]).per(10)

    render("comparison_table_templates/index.html.erb")
  end

  def show
    @comparison_table = ComparisonTable.find(params.fetch("id_to_display"))

    render("comparison_table_templates/show.html.erb")
  end

  def new_form
    @comparison_table = ComparisonTable.new

    render("comparison_table_templates/new_form.html.erb")
  end

  def create_row
    @comparison_table = ComparisonTable.new

    @comparison_table.estimated_spend = params.fetch("estimated_spend")
    @comparison_table.user_id = params.fetch("user_id")
    @comparison_table.insurance_plan_id = params.fetch("insurance_plan_id")

    if @comparison_table.valid?
      @comparison_table.save

      redirect_back(:fallback_location => "/comparison_tables", :notice => "Comparison table created successfully.")
    else
      render("comparison_table_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_insurance_plan
    @comparison_table = ComparisonTable.new

    @comparison_table.estimated_spend = params.fetch("estimated_spend")
    @comparison_table.user_id = params.fetch("user_id")
    @comparison_table.insurance_plan_id = params.fetch("insurance_plan_id")

    if @comparison_table.valid?
      @comparison_table.save

      redirect_to("/insurance_plans/#{@comparison_table.insurance_plan_id}", notice: "ComparisonTable created successfully.")
    else
      render("comparison_table_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @comparison_table = ComparisonTable.find(params.fetch("prefill_with_id"))

    render("comparison_table_templates/edit_form.html.erb")
  end

  def update_row
    @comparison_table = ComparisonTable.find(params.fetch("id_to_modify"))

    @comparison_table.estimated_spend = params.fetch("estimated_spend")
    
    @comparison_table.insurance_plan_id = params.fetch("insurance_plan_id")

    if @comparison_table.valid?
      @comparison_table.save

      redirect_to("/comparison_tables/#{@comparison_table.id}", :notice => "Comparison table updated successfully.")
    else
      render("comparison_table_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @comparison_table = ComparisonTable.find(params.fetch("id_to_remove"))

    @comparison_table.destroy

    redirect_to("/users/#{@comparison_table.user_id}", notice: "ComparisonTable deleted successfully.")
  end

  def destroy_row_from_insurance_plan
    @comparison_table = ComparisonTable.find(params.fetch("id_to_remove"))

    @comparison_table.destroy

    redirect_to("/insurance_plans/#{@comparison_table.insurance_plan_id}", notice: "ComparisonTable deleted successfully.")
  end

  def destroy_row
    @comparison_table = ComparisonTable.find(params.fetch("id_to_remove"))

    @comparison_table.destroy

    redirect_to("/comparison_tables", :notice => "Comparison table deleted successfully.")
  end
end
