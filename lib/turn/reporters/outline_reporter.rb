require 'turn/reporter'

module Turn

  # = Outline Reporter (Turn's Original)
  #
  class OutlineReporter < Reporter

    def start_suite(suite)
      @suite = suite
      @time  = Time.now
      #files = suite.collect{ |s| s.file }.join(' ')
      io.puts "Loaded suite #{suite.name}"
      io.puts "Started"
    end

    def start_case(kase)
      io.puts(kase.name)
    end

    def start_test(test)
      #if @file != test.file
      #  @file = test.file
      #  io.puts(test.file)
      #end
      io.print "    %-69s" % test.name
    end

    def pass(message=nil)
      io.puts " #{PASS}"
      if message
        message = ::ANSICode.magenta(message) if COLORIZE
        message = message.to_s.tabto(8)
        io.puts(message)
      end
    end

    def fail(message=nil)
      io.puts(" #{FAIL}")
      if message
        message = ::ANSICode.magenta(message) if COLORIZE
        message = message.to_s.tabto(8)
        io.puts(message)
      end
    end

    def error(message=nil)
      io.puts("#{ERROR}")
      io.puts(message.to_s) if message
    end

    def finish_test(test)
    end

    #def finish_case(kase)
    #end

    def finish_suite(suite)
      total   = suite.count_tests
      failure = suite.count_failures
      error   = suite.count_errors
      pass    = total - failure - error

      bar = '=' * 78
      if COLORIZE
        bar = if pass == total then ::ANSICode.green bar
              else ::ANSICode.red bar end
      end

      tally = [total, suite.count_assertions]

      io.puts bar
      io.puts "  pass: %d,  fail: %d,  error: %d" % [pass, failure, error]
      io.puts "  total: %d tests with %d assertions in #{Time.new - @time} seconds" % tally
      io.puts bar
    end

  end

end

