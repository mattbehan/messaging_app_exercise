Rails.application.routes.draw do

root 'message_threads#index'

devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions", registrations: "patients/registrations"}
devise_for :care_managers, path: 'care_managers', controllers: { sessions: "care_managers/sessions", registrations: "care_managers/registrations"}

resources :message_threads, only: [:index]

end
