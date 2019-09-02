class ApplicationController < ActionController::API
	def not_found
    render json: { error: "Garden Not Found" }, status: :not_found
	end
end
