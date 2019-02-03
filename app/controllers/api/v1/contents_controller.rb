module Api::V1
  class ContentsController < ApplicationController
    def index
      render json: Content.index_content_cached
    end
  end
end
