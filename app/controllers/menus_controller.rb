# frozen_string_literal: true

class MenusController < ApplicationController
  skip_before_action :authenticate_user!
  def index; end
end
