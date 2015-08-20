module FreshBooks
  class Contractor < FreshBooks::Base
    define_schema do |s|
      s.fixnum :contractor_id
      s.string :name, :email
      s.float :rate
    end

    actions :list, :get

    def self.current
      response = FreshBooks::Base.connection.call_api("#{api_class_name}.current")
      response.success? ? self.new_from_xml(response.elements[1]) : nil
    end
  end
end
