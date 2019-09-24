class ApplicationController < ActionController::API
	def garden_not_found
    render json: { error: "Garden Not Found" }, status: :not_found
	end

  def unauthorized
    render json: { error: "Invalid Credentials" }, status: :unauthorized
  end
end
