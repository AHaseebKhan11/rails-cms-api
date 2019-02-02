module Api::V1
  class ContentsController < ApplicationController
    def index
      render json: Content.all, each_serializer: Contents::IndexSerializer, root: false
    end
  end
end