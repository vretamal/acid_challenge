module Rest
  class LoginController < ApplicationController
    # WebService 1. It calls WebService 2 and return the response to the user
    def login
      require 'net/http'
      require 'uri'
      params = {'image' => login_params[:image]}
      parsed_uri = URI.parse(request.base_url + '/rest/verify_user/' +
                             login_params[:email].gsub!(".","%2e"))

      resp = Net::HTTP.post_form(parsed_uri, params)
      if resp.code.eql? '200'
        render json: {message: 'OK'}, status: :ok
      elsif resp.code.eql? '401'
        render json: {message: 'No Autorizado'}, status: :unauthorized
      else
        render json: {message: 'Bad Request'}, status: :bad_request
      end
    end

    # WebService 2. It make the verification of the image and return the
    # response to the WebService 1. Also send the email to user.
    def verify_user
      user = User.where(email: login_params[:email]).first
      if user && user.validate_image(login_params[:image])
        UserNotifierMailer.send_login_email(user, request.user_agent, true).deliver
        render json: {message: 'OK'}, status: :ok
      else
        UserNotifierMailer.send_login_email(user, request.user_agent, false).deliver
        render json: {message: 'No Autorizado'}, status: :unauthorized
      end
    end

    private
    def login_params
      params.permit(:image, :email)
    end
  end
end
