module Lita
  module Handlers
    class Dargon < Handler
      # insert handler code here
      route(/^dargon/, :dargon, help: { 'dargon' => 'print a dargon' })

      def dargon(response)
        a_dargon = File.read dargon_path

        # Properly escape the dargon
        case robot.config.robot.adapter
        when :slack
          a_dargon = "```#{a_dargon}```"
        end

        response.reply a_dargon
      end

      def dargon_path
        File.join(
          File.dirname(__FILE__), 
          '..', '..', '..',
          'dargon.txt')
      end

      Lita.register_handler(self)
    end
  end
end
