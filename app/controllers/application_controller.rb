class ApplicationController < ActionController::API
	def not_found
  	raise ActionController::RoutingError.new('Not Found')
	end
end
