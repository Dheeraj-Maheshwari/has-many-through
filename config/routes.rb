Rails.application.routes.draw do
    root 'patients#index'
    resources :books, :patients, :doctors, :appointments, :users, :addresses, :buses
    post 'create_doctor', to: 'doctors#create_doctor'
end
