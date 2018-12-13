Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "insurance_plans#index"
  # Routes for the Interested plan resource:

  # CREATE
  get("/interested_plans/new", { :controller => "interested_plans", :action => "new_form" })
  post("/create_interested_plan", { :controller => "interested_plans", :action => "create_row" })
  post("/create_interested_plan_from_insurance_plan", { :controller => "interested_plans", :action => "create_row_from_insurance_plan" })

  # READ
  get("/interested_plans", { :controller => "interested_plans", :action => "index" })
  get("/interested_plans/:id_to_display", { :controller => "interested_plans", :action => "show" })

  # UPDATE
  get("/interested_plans/:prefill_with_id/edit", { :controller => "interested_plans", :action => "edit_form" })
  post("/update_interested_plan/:id_to_modify", { :controller => "interested_plans", :action => "update_row" })

  # DELETE
  get("/delete_interested_plan/:id_to_remove", { :controller => "interested_plans", :action => "destroy_row" })
  get("/delete_interested_plan_from_insurance_plan/:id_to_remove", { :controller => "interested_plans", :action => "destroy_row_from_insurance_plan" })
  get("/delete_interested_plan_from_user/:id_to_remove", { :controller => "interested_plans", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Insurance plan resource:

  # CREATE
  get("/insurance_plans/new", { :controller => "insurance_plans", :action => "new_form" })
  post("/create_insurance_plan", { :controller => "insurance_plans", :action => "create_row" })

  # READ
  get("/insurance_plans", { :controller => "insurance_plans", :action => "index" })
  get("/insurance_plans/:id_to_display", { :controller => "insurance_plans", :action => "show" })

  # UPDATE
  get("/insurance_plans/:prefill_with_id/edit", { :controller => "insurance_plans", :action => "edit_form" })
  post("/update_insurance_plan/:id_to_modify", { :controller => "insurance_plans", :action => "update_row" })

  # DELETE
  get("/delete_insurance_plan/:id_to_remove", { :controller => "insurance_plans", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
