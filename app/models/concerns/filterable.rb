module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      status_param = filtering_params[:status]
      baby_param = filtering_params[:baby]
      assistant_param = filtering_params[:assistant]

      status = ("AND LENGTH(duration) > 0 AND duration IS NOT NULL" if status_param == "1") || ("AND LENGTH(duration) = 0 OR duration IS NULL" if status_param == "2") || ""
      if !baby_param.blank? && !assistant_param.blank?
        self.includes(:baby, :assistant).where("baby_id = ? and assistant_id = ? #{status}", baby_param, assistant_param ).order('start_time DESC')
      elsif !baby_param.blank?
        self.includes(:baby, :assistant).where("baby_id = ? #{status}", baby_param).order('start_time DESC')
      elsif !assistant_param.blank?
        self.includes(:baby, :assistant).where("assistant_id = ? #{status}", assistant_param).order('start_time DESC')
      else
        self.includes(:baby, :assistant).where(("LENGTH(duration) > 0 AND duration IS NOT NULL" if status_param == "1") || ("LENGTH(duration) = 0 OR duration IS NULL" if status_param == "2") || "").order('start_time DESC')
      end
    end
  end
end