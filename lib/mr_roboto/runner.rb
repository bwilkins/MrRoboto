#encoding: utf-8

require 'mr_roboto'

module MrRoboto

  class Runner

    def run(args)
      filename = args.first
      return "No such file or directory #{filename}" unless File.exists?(filename)
    end

  end

end
