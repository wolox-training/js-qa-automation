module AmazonSearchElementsHelper

  def sort_search_results(sortedBy)
    sortedByValue = SortTextToValue(sortedBy)
    select_option_from_dropdown(:id, :value, sortedByValue, 's-result-sort-select')
  end

  def SortTextToValue(sortedBy)
    case sortedBy
      when 'Price: Low to High' then return 'price-asc-rank'
      when 'Price: High to Low' then return 'price-desc-rank'
      when 'Avg. Customer Review' then return 'review-rank'
      when 'Newest Arrivals' then return 'date-desc-rank'
      else return 'relevanceblender'
    end
  end

end

World AmazonSearchElementsHelper
