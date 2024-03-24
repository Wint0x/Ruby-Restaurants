class ErrorsController < ActionController::Base
	def error404
		render status::not_found
	end
end
