class SessionsController < Devise::SessionsController
 # frozen_string_literal: true
 def address_form_get; end
 def credit_get; end

  def user_info_keep
    session[:nickname] = params[:nickname]
    session[:email] =    params[:email]
    session[:password] = params[:password]
    session[:user_id] = User.all.count.to_i + 1
    redirect_to new_address_form_get_path
  end

  def address_info_keep
    session[:first_name] =      params[:last_name]
    session[:last_name] =       params[:last_name]
    session[:kana_first_name] = params[:kana_first_name]
    session[:kana_last_name] =  params[:kana_last_name]
    session[:postal_code] =     params[:postal_code]
    session[:prefectures] =     params[:prefectures]
    session[:city] =            params[:city]
    session[:address] =         params[:address]
    session[:building] =        params[:building]
    session[:phonenumber] =     params[:phonenumber]

    redirect_to new_credit_get_path
  end

  

  def credit_info_keep
    user = User.create( nickname: session[:nickname], 
                        email: session[:email],
                        password: session[:password]
                        )

    Address.create(first_name: session[:first_name],
                   last_name: session[:last_name], 
                   kana_first_name: session[:kana_first_name], 
                   kana_last_name: session[:kana_last_name], 
                   postal_code: session[:postal_code], 
                   prefectures: session[:prefectures], 
                   city: session[:city], 
                   address: session[:address], 
                   building: session[:building], 
                   phonenumber: session[:phonenumber],
                   )
    sign_in user

    redirect_to root_path
  end

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end
