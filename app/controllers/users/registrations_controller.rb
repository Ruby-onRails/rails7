class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: 'Sign in up successfully',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user
    log_out_failure
  end

  def log_out_success
    render json: { message: 'You are logout' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'hmm nothing happened' }, status: :unauthorized
  end
end