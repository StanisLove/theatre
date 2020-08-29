# frozen_string_literal: true

class SpectacleRoutes < Application
  helpers PaginationLinks

  namespace '/spectacles' do
    get do
      page       = params[:page].presence || 1
      page_size  = Settings.pagination.page_size
      serializer = SpectacleSerializer

      Spectacle.reverse_order(:updated_at)
               .then { |s| s.paginate(page.to_i, page_size) }
               .then { |s| serializer.new(s.all, links: pagination_links(s)) }
               .then { |s| json(s.serializable_hash) }
    end

    post do
      operation = Operations::Spectacles::Create.new
      result    = operation.call(params[:spectacle])

      case result
      when Success
        status 201
        spectacle = SpectacleSerializer.new(result.value!)
        json spectacle.serializable_hash
      when Failure
        status 422
        error_response result.failure
      end
    end
  end
end
