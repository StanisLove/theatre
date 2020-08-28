class SpectacleRoutes < Application
  helpers PaginationLinks

  namespace '/spectacles' do
    get do
      page = params[:page].presence || 1
      spectacles = Spectacle.reverse_order(:updated_at)
      spectacles = spectacles.paginate(page.to_i, Settings.pagination.page_size)
      serializer = SpectacleSerializer.new(spectacles.all, links: pagination_links(spectacles))

      json serializer.serializable_hash
    end

    post do
      params = validate_with!(SpectacleParamsContract)
      spectacle = Spectacle.new(params[:spectacle])

      if spectacle.save(raise_on_failure: false)
        serializer = SpectacleSerializer.new(spectacle)

        status 201
        json serializer.serializable_hash
      else
        status 422
        error_response spectacle
      end
    end
  end
end
