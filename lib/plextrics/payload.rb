module Plextrics
  class Payload
    LineRe = /^\d+ \<\d+\>1 (\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d\+00:00) [a-z0-9-]+ ([a-z0-9\-\_\.]+) ([a-z0-9\-\_\.]+) \- (.*)$/
    IgnoreMsgRe = /(^ *$)|(Processing|Parameters|Completed|\[Worker\(host)/
    TimeSubRe = / \d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d-\d\d:\d\d/
    AttrsRe = /( *)([a-zA-Z0-9\_\-\.]+)=?(([a-zA-Z0-9\.\-\_\.]+)|("([^\"]+)"))?/

    class << self

      def unpack(input)
        while input && input.length > 0
          if m = input.match(/^(\d+) /)
            num_bytes = m[1].to_i
            msg = input[m[0].length..(m[0].length + num_bytes)]
            if data = parse([m[0], msg.chomp].join)
              puts 'hello!'
            end
            input = input[(m[0].length + num_bytes)..(input.length)]
          elsif m = input.match(/\n/)
            input = m.post_match
          else
          end
        end
      end

      def parse(line)
        puts line
        if m = line.match(LineRe)
          if data = parse_msg(m[4])
            data["time"] = Time.parse(m[1])
            data["source"] = m[2]
            data["ps"] = m[3]
            data
          end
        end
      end

      def parse_msg(msg)
        if !msg.match(IgnoreMsgRe)
          data = {}
          msg.scan(AttrsRe) do |_, key, _, val1, _, val2|
            if (((key == "service") || (key == "wait")) && val1)
              data[key] = val1.sub("ms", "")
            else
              data[key] = (val1 || val2 || "true")
            end
          end
          data
        end
      end

    end
  end
end
