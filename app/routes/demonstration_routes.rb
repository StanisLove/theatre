class DemonstrationRoutes < Application
  helpers PaginationLinks

  namespace '/demonstrations' do
    get do
      page       = params[:page].presence || 1
      page_size  = Settings.pagination.page_size
      serializer = DemonstrationSerializer

      Demonstration.reverse_order(:updated_at)
        .then { |demos| demos.paginate(page.to_i, page_size) }
        .then { |demos| serializer.new(demos.all, links: pagination_links(demos)) }
        .then { |demos| json(demos.serializable_hash) }
    end

    post do
      operation = Operations::Demonstrations::Create.new
      result    = operation.call(params)

      case result
      when Success
        status 201
        demonstration = DemonstrationSerializer.new(result.value!)
        json demonstration.serializable_hash
      when Failure
        status 422
        error_response result.failure
      end
    end
  end
end
