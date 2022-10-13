class GlassSerializer
  include JSONAPI::Serializer
  attributes :total_price, :quantity, :currency, :frame, :lense

end
