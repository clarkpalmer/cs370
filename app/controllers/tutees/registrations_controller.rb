# frozen_string_literal: true

class Tutees::RegistrationsController < Devise::RegistrationsController
  layout 'tutee_layout', :only => [:show, :edit, :update]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @tutee = Tutee.create!(tutee_params)
    if @tutee
      respond_to do |format|
        flash[:notice] = "#{@tutee.first_name} #{@tutee.last_name} was successfully created."
        puts "tutee created"
        puts @tutee.id
        params[:id] = @tutee.id
        format.html { redirect_to tutee_path(@tutee.id)}
      end
    else
      flash[:notice] = "Student was not successfully created."
      redirect_to new_tutee_session_path
    end
  end

  def tutee_params
    params.require(:tutee).permit( :year, :email, :first_name,
      :last_name, :birthdate, :sid, :gender, :pronoun, :ethnicity, :dsp, :transfer, :major)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   new_tutee_session_path(resource_name)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
   def after_update_path_for(resource)
      puts 'resource!!'
      puts resource
      sign_in_after_change_password? ? tutee_path(resource) : new_tutee_session_path(resource)
    end
end
