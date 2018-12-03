Rails.application.routes.draw do
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
