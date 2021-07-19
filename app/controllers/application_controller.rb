class ApplicationController < ActionController::API

  def invalid_params
    render json: {
                  error: 'Parameter requirement',
                  message: 'Oh no! Your request cannot be completed.'
                  },
                  status: 400
  end
end
