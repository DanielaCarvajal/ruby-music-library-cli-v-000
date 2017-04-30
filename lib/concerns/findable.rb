module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect{|a| a.name == name }
    end

    #def new_by_name(name)
    #  song = self.new
    #  song.name = name
    #  song
    #end

    def create_by_name(name)
      self.new.tap do |o|
        o.name = name # ambos sirven
      end
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

  end
end
