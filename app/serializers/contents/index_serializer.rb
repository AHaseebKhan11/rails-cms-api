module Contents
  class IndexSerializer < ActiveModel::Serializer
    attributes :title, :published_date, :author, :summary, :content

    def published_date
      object.published_date.strftime('%d-%m-%Y')
    end
  end
end
