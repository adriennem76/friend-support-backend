class SupportItemSerializer < ActiveModel::Serializer
  attributes :id, :category, :description, :frequency_num, :frequency_period, :references
end
