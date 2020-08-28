module PaginationLinks
  def pagination_links(dataset)
    return {} if dataset.pagination_record_count.zero?

    {
      first: pagination_link(page: 1),
      last:  pagination_link(page: dataset.page_count),
      next:  pagination_link(page: dataset.next_page.presence),
      prev:  pagination_link(page: dataset.prev_page.presence)
    }
  end

  private

  def pagination_link(page:)
    return unless page

    query_string = request.GET.merge('page' => page).to_query

    [request.path, query_string].join('?')
  end
end
