class ApplicationController < ActionController::Base
  before_action :authenticate_worker!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_worker.has_role?(:admin)
      workers_path
    elsif current_worker.has_role?(:yunying)
      categories_path
    end
  end

  def current_ability
    @current_ability ||= ::Ability.new(current_worker)
  end
end
