module DefaultPageContent

  extend ActiveSupport::Concern

  included do
    before_filter :set_page_default
  end

  def set_page_default
    @page_title = "DevcampPortfolio | My Portfolio Site"
    @seo_keywords = "Abhi Mishra portfolio"
  end

end
