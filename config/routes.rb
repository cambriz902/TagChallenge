Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :tag do 
        post :create
        get :show
        delete :destroy
      end
      resource :stat do
        get :index
        get :show
      end
    end
  end
end
