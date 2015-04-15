class HomesController < ApplicationController
  layout :resolve_layout

  def index
    resolve_layout
  end

  private

  def resolve_layout
    case action_name
    when "index"
      "homepage"
    else
      "application"
    end
  end
end
