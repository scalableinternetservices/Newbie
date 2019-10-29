class ApplicationController < ActionController::Base
	def team
    render html: "TEAM NEWBIE: A credibility checker for news articles"
  end

  def output
    render html: "Credibility Score Output"
  end
end
