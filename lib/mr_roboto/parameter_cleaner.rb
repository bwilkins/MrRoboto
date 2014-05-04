#encoding: utf-8

module MrRoboto
  class ParameterCleaner

    def self.clean_parameter(parameter)
      return parameter.to_i if parameter =~ /\d+/
      parameter.downcase.to_sym
    end

    def self.clean_parameters(parameters)
      parameters.map do |parameter|
        clean_parameter(parameter)
      end
    end

  end
end
