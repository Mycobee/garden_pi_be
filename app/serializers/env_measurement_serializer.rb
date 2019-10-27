class EnvMeasurementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :humidity, :temperature, :soil_moisture, :created_at
end
