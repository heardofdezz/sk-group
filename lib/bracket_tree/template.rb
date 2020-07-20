module BracketTree
  # Contains the logic for common template formats. Holds match progression as well as seat order to generate the correct bracket tree.
  module Template
    class Base
      class << self
        # Reads stored JSON files to generate a Template
        #
        # @param [Fixnum] size - player count
        # return [nil, BracketTree::Template] template - the resulting bracket template
        def by_size size
          filename = File.join location, "#{size}.json"

          if File.exists? filename
            from_json JSON.parse(File.read(filename), symbolize_names: true)
          else
            return nil
          end
        end

        # Generates Template from JSON
        #
        # @param [String] json - the bracket template in its standard data specification
        # @return [BracketTree::Template]
        def from_json json
          template = new
          if json[:seats]
            template.seats = json[:seats].map { |s| s[:position] }
          end

          if json[:starting_seats]
            template.starting_seats = json[:starting_seats]
          end

          if json[:matches]
            template.matches = json[:matches]
          end

          template
        end

        # Folder location of the template JSON files. Abstract method
        # @return [String] location - the folder name of the JSON files
        def location
          raise NotImplementedError, 'Abstract method, please define `location` in subclass.'
        end
      end

      attr_accessor :seats, :starting_seats, :matches

      def initialize
        @seats = []
        @starting_seats = []
        @matches = []
      end

      # Returns hash representation of the Template
      #
      # @return [Hash] template
      def to_h
        {
          seats: @seats.map { |s| { position: s } },
          starting_seats: @starting_seats,
          matches: @matches
        }
      end

      alias_method :seed_order, :starting_seats
    end
  end
end
