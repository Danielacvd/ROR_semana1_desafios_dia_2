class Table
    attr_accessor :mesa, :tablas
    def initialize(mesa, *tablas)
        @mesa = mesa
        @tablas = *tablas.map(&:to_i)
    end

    def mayorxmesa
        puts "El mayor monto por #{@mesa} es: #{@tablas.max}"
    end

    def promedio
        @tablas.inject(&:+)/@tablas.size.to_f
    end
end

file = File.open('casino.txt','r')
data = file.readlines
file.close
puts data

constablas = []
data.each do |line|
    #ls de line split
    ls = line.split(', ')
    constablas << Table.new(*ls)
end

constablas.each do |a|
    puts "#{a.mayorxmesa} dia#{a.tablas.find_index(a.tablas.max)+1}"
end

promedioss = constablas.map(&:promedio)
puts "El promedio total entre dias/mesas es : #{promedioss.inject(:+) / promedioss.size}"