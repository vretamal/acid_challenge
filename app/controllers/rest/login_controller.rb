module Rest
  class LoginController < ApplicationController
    def login
      require 'net/http'
      require 'uri'
      params = {'image' => login_params[:image]}
      parsed_uri = URI.parse(request.base_url + '/rest/verify_user/' +
                             login_params[:email])

      resp = Net::HTTP.post_form(parsed_uri, params)
      if resp.code.eql? '200'
        render json: {message: 'OK'}, status: :ok
      elsif resp.code.eql? '401'
        render json: {message: 'No Autorizado'}, status: :unauthorized
      else
        render json: {message: 'Bad Request'}, status: :bad_request
      end
    end

    def verify_user
      user = User.where(email: login_params[:email]).first
      if user && user.validate_image(login_params[:image])
        render json: {message: 'OK'}, status: :ok
      else
        render json: {message: 'No Autorizado'}, status: :unauthorized
      end
    end

    private
    def login_params
      params.permit(:image, :email)
    end
  end
end
