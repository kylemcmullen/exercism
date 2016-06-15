module BookKeeping
  VERSION=2
end
module RunLengthEncoding
  def self.encode(input)
    runs = []

    prev = nil
    run_length = 0
    
    for char in input.chars
      if char == prev
        run_length += 1
      else
        append_run(run_length, prev, runs)

        prev = char
        run_length = 1
      end
    end
    
    append_run(run_length, prev, runs)

    runs.map(&:join).inject('', :+)
  end

  def self.decode(input)
    runs = []

    temp = ''
    for char in input.chars
      if char =~ /[0-9]/
        temp += char
      else
        run_length = 1
        if temp != ''
          run_length = temp.to_i
        end

        runs << char * run_length

        temp = ''
      end
      
    end

    runs.join
  end

  private

  def self.append_run(run_length, prev, runs)
    if prev
      run = [prev]
      run.unshift(run_length) if run_length > 1
      runs << run
    end
  end
end