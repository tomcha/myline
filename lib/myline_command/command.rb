module MylilneCommand
  class Command
    def self.start_unbrella_advice
      ua = MylineCommand::UnbrellaAdviser.new
      ua.get_umbrella_data
    end
    def self.start_dust_callender
    end
  end
end
