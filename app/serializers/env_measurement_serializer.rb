class EnvMeasurementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :soil_temperature, :soil_moisture, :created_at
end
