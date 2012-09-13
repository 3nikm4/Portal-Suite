Portal::Application.routes.draw do


  resources :access_levels
  resources :access_groups
  resources :audits
  resources :calls
  resources :call_locations
  resources :call_types
  resources :contact_types
  resources :contacts
  resources :disposable_types
  resources :disposables
  resources :devices
  resources :device_assignments
  resources :device_batteries
  resources :device_carriers
  resources :device_problem_statuses
  resources :device_problems
  resources :device_tests
  resources :device_types
  resources :device_statuses
  resources :groups
  resources :locations
  resources :location_assignments
  resources :location_types
  resources :patients
  resources :patient_assignments
  resources :practices
  resources :user_locations


#######################################
##  todo fix to direct to appropriate 
##  place based on login creds
#######################################

  authenticated :user do
    root :to => "dashboard#index"
  end

#######################################


  devise_for :users
  resources :users

  root :to => "dashboard#index"

#######################################
##  redirect for calltracker
##  to be replaced with dynamic dash 
#######################################

  match "/dashboard" => "dashboard#index"

#######################################

  # custom admin routes
  get "callsadmin" => "calls#admin", :as => "callsadmin"

  # get routes for reports
  get "reports/all_locations_summary" => "reports#all_locations_summary", :as => "all_locations_summary"
  get "reports/location_summary/:id" => "reports#location_summary", :as => "location_summary"
  get "reports/problematic_devices" => "reports#problematic_devices", :as => "problematic_devices"
  get "reports/devices_in_use" => "reports#devices_in_use", :as => "devices_in_use"
  get "reports/rma_devices" => "reports#rma_devices", :as => "rma_devices"
  get "reports/onsite_devices" => "reports#onsite_devices", :as => "onsite_devices"
  get "reports/unreturned_devices" => "reports#unreturned_devices", :as => "unreturned_devices"
  get "reports/full_inventory" => "reports#full_inventory", :as => "full_inventory"
  get "reports/last_known_location" => "reports#last_known_location", :as => "last_known_location"

  # get routes for authentication
  get "users/signup" => "home#index"
  get "searches/results" => "searches#results", :as => "searches"
  get "/search" => "searches#index", :as => "search"

  # post routes for search
  post "searches/patient" => "searches#patient", :as => "patientsearch"
  post "searches/type" => "searches#type", :as => "typesearch"
  post "searches/rep" => "searches#rep", :as => "repsearch"
  post "searches/date" => "searches#date", :as => "datesearch"
  post "searches/device" => "searches#device", :as => "devicesearch"
  post "searches/assignment_device" => "searches#assignment_device", :as => "assignment_device_search"
  post "searches/assignment_patient" => "searches#assignment_patient", :as => "assignment_patient_search"
  post "searches/assignment_location" => "searches#assignment_location", :as => "assignment_location_search"


end
