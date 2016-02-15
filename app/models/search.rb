class Search
  def self.search(term)
    search_term = "%#{term.downcase}"

    @recipe = Recipe.where('lower(title) LIKE ? OR lower(body) LIKE?', search_term, search_term) +
      tagged_with(keyword_search)
  end
end
