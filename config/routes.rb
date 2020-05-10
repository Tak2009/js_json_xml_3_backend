Rails.application.routes.draw do
  resources :employees
  resources :departments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/employees2", to: "employees#index2", as: "index2"
  get "/org_chart", to: "employees#org_chart", as: "org_chart"
end
